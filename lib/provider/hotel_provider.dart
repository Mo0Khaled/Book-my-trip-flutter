import 'package:bookmytrip/models/hotel_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HotelProvider with ChangeNotifier {
  List<HotelModel> _hotels = [];
  final String token;



  List<HotelModel> get hotels => _hotels;
  HotelProvider(
      this.token,
      this._hotels,
      );
  HotelModel findById(String id) =>
      _hotels.firstWhere((element) => element.id == id);

  Future<void> fetchHotels() async {
    final url =
        'https://book-my-trip-8b2f5.firebaseio.com/hotels.json?auth=$token';
    try {
      final response = await http.get(url);
      final data = json.decode(response.body) as Map<String, dynamic>;
      if (data == null) {
        return;
      }
      final List<HotelModel> loadedHotels = [];
      data.forEach((hotelId, hotelData) {
        List<String> img = [];
        for (var i in hotelData['images']) {
          img.add(i);
        }
        loadedHotels.add(
          HotelModel(
            id: hotelId,
            hotelName: hotelData['hotelName'],
            baseImage: hotelData['baseImage'],
            images: img,
            dayPrice: hotelData['dayPrice'],
            description: hotelData['description'],
            location: hotelData['location'],
            phoneNumber: hotelData['phoneNumber'],
          ),
        );
      });
      _hotels = loadedHotels.reversed.toList();
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> addHotel(HotelModel hotelModel) async {
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels.json?auth=$token';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'hotelName': hotelModel.hotelName,
            'baseImage': hotelModel.baseImage,
            'images': hotelModel.images.toList(),
            'dayPrice': hotelModel.dayPrice,
            'description': hotelModel.description,
            'location': hotelModel.location,
            'phoneNumber': hotelModel.phoneNumber,
          },
        ),
      );
      final newHotel = HotelModel(
        id: json.decode(response.body)['name'],
        hotelName: hotelModel.hotelName,
        baseImage: hotelModel.baseImage,
        images: hotelModel.images.toList(),
        dayPrice: hotelModel.dayPrice,
        description: hotelModel.description,
        location: hotelModel.location,
        phoneNumber: hotelModel.phoneNumber,
      );
      _hotels.add(newHotel);
      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updateHotel(String id, HotelModel updatedHotel) async {
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels/$id.json?auth=$token';
    final hotelIndex = _hotels.indexWhere((newHotel) => newHotel.id == id);
    if (hotelIndex >= 0) {
      await http.patch(
        url,
        body: json.encode(
          {
            'hotelName': updatedHotel.hotelName,
            'baseImage': updatedHotel.baseImage,
            'images': updatedHotel.images.toList(),
            'dayPrice': updatedHotel.dayPrice,
            'description': updatedHotel.description,
            'location': updatedHotel.location,
            'phoneNumber': updatedHotel.phoneNumber,
          },
        ),
      );
      _hotels[hotelIndex] = updatedHotel;
      notifyListeners();
    } else {
      print("000");
    }
  }

  Future<void> deleteHotel(String id) async {
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels/$id.json?auth=$token';

    final existingHotelIndex =
        _hotels.indexWhere((productIndex) => productIndex.id == id);
    var existingHotel = _hotels[existingHotelIndex];
    _hotels.removeAt(existingHotelIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _hotels.insert(existingHotelIndex, existingHotel);
      notifyListeners();
    }
    existingHotel = null;
  }
}

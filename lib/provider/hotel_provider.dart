import 'package:bookmytrip/models/hotel_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HotelProvider with ChangeNotifier {
  final List<HotelModel> _hotels = [
    // HotelModel(
    //   id: "1",
    //   hotelName: "Hotel Galaxy",
    //   baseImage: 'https://cf.bstatic.com/images/hotel/max1024x768/222/222713113.jpg',
    //   images: [
    //     'https://media-cdn.tripadvisor.com/media/photo-s/1b/ca/55/aa/steigenberger-hotel-el.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/222/222239457.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/231/231157566.jpg',
    //   ],
    //   dayPrice: 80,
    //   description:
    //       "Hotel galaxy is one of the finest hotel for any purpose.It has wifi, parking, luxury and semi luxury rooms. It has great dining area. Plus you can hold your business meetings comfortably.",
    //   location: '145, Ground Floor, Ring Road Apt., New York City.',
    //   phoneNumber: 10987654321,
    // ),
    // HotelModel(
    //   id: "2",
    //   hotelName: "Hotel Livingstone",
    //   baseImage: 'https://cf.bstatic.com/images/hotel/max1024x768/231/231157566.jpg',
    //   images: [
    //     'https://media-cdn.tripadvisor.com/media/photo-s/1b/ca/55/aa/steigenberger-hotel-el.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/222/222239457.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/231/231157566.jpg',
    //   ],
    //   dayPrice: 50,
    //   description:
    //   "Hotel galaxy is one of the finest hotel for any purpose.It has wifi, parking, luxury and semi luxury rooms. It has great dining area. Plus you can hold your business meetings comfortably.",
    //   location: '145, Ground Floor, Ring Road Apt., New York City.',
    //   phoneNumber: 10987654321,
    // ),
    // HotelModel(
    //   id: "3",
    //   hotelName: "Hotel Star",
    //   baseImage: 'https://media-cdn.tripadvisor.com/media/photo-s/1b/ca/55/aa/steigenberger-hotel-el.jpg',
    //   images: [
    //     'https://media-cdn.tripadvisor.com/media/photo-s/1b/ca/55/aa/steigenberger-hotel-el.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/222/222239457.jpg',
    //     'https://cf.bstatic.com/images/hotel/max1024x768/231/231157566.jpg',
    //   ],
    //   dayPrice: 80,
    //   description:
    //   "Hotel galaxy is one of the finest hotel for any purpose.It has wifi, parking, luxury and semi luxury rooms. It has great dining area. Plus you can hold your business meetings comfortably.",
    //   location: '145, Ground Floor, Ring Road Apt., New York City.',
    //   phoneNumber: 10987654321,
    // ),
  ];

  List<HotelModel> get hotels => _hotels;
  HotelModel findById(String id) => _hotels.firstWhere((element) => element.id == id);
  Future<void> fetchHotels() async {}

  Future<void> addHotel(HotelModel hotelModel) async {
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels.json';
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
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels/$id.json';
    final hotelIndex = _hotels.indexWhere((newHotel) => newHotel.id == id);
    if (hotelIndex >= 0) {
      await http.patch(
        url,
        body: json.encode(
          {
            updatedHotel.toJson(),
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
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/hotels/$id.json';

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

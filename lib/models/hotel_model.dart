import 'package:flutter/foundation.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class HotelModel {
  String id;
  String hotelName;
  String baseImage;
  List<Asset> images;
  double dayPrice;
  String description;
  String location;
  int phoneNumber;

  HotelModel({
    @required this.id,
    @required this.hotelName,
    @required this.baseImage,
    @required this.images,
    @required this.dayPrice,
    @required this.description,
    @required this.location,
    @required this.phoneNumber,
  });

  HotelModel fromJson(Map<String, dynamic> data) {
    return HotelModel(
      id: data['id'],
      baseImage: data['baseImage'],
      dayPrice: data['dayPrice'],
      description: data['description'],
      hotelName: data['hotelName'],
      images: data['images'] as List,
      location: data['location'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['baseImage'] = this.baseImage;
    data['dayPrice'] = this.dayPrice;
    data['description'] = this.description;
    data['hotelName'] = this.hotelName;
    data['images'] = this.images;
    data['location'] = this.location;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }

}

import 'package:flutter/foundation.dart';

class OrderModel {
  final String id;
  final String hotelName;
  final double price;
  final int nights;
  final int days;
  final int rooms;
  final DateTime dataTime;

  OrderModel({
     this.id,
    @required this.hotelName,
    @required this.price,
    @required this.nights,
    @required this.days,
    @required this.rooms,
     this.dataTime,
  });
}

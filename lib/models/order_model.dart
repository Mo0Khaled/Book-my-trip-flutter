import 'package:bookmytrip/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class OrderModel {
  final String id;
  final double totalAmount;
  final CartItemModel cartItemModel;
  final DateTime dataTime;

  OrderModel({
    @required this.id,
    @required this.totalAmount,
    @required this.cartItemModel,
    @required this.dataTime,
  });
}

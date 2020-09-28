import 'package:bookmytrip/models/cart_item.dart';
import 'package:bookmytrip/models/order_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  Future<void> bookNow(CartItemModel cartItemModel) async {
    final time = DateTime.now();
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/booking.json';
    final response = await http.post(
      url,
      body: json.encode({
        'totalAmount': cartItemModel.price,
        'hotel': {
          'hotelName': cartItemModel.hotelName,
          'price': cartItemModel.price,
          'nights': cartItemModel.nights,
          'days': cartItemModel.days,
          'rooms': cartItemModel.rooms,
        },
        'dateTime': time.toIso8601String(),
      }),
    );
    _orders.insert(
      0,
      OrderModel(
        id: json.decode(response.body)['name'],
        totalAmount: cartItemModel.price,
        cartItemModel: cartItemModel,
        dataTime: time,
      ),
    );
    notifyListeners();
  }
}

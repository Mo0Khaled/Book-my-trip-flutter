import 'package:bookmytrip/models/order_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  Future<void> bookNow(OrderModel orderModel) async {
    final time = DateTime.now();
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/booking.json';
    final response = await http.post(
      url,
      body: json.encode({
        'totalAmount': orderModel.price,
        'hotel': {
          'hotelName': orderModel.hotelName,
          'price': orderModel.price,
          'nights': orderModel.nights,
          'days': orderModel.days,
          'rooms': orderModel.rooms,
        },
        'dateTime': time.toIso8601String(),
      }),
    );
    _orders.insert(
      0,
      OrderModel(
        id: json.decode(response.body)['name'],
        hotelName: orderModel.hotelName,
        price: orderModel.price,
        nights: orderModel.nights,
        days: orderModel.days,
        rooms: orderModel.rooms,
        dataTime: time,
      ),
    );
    notifyListeners();
  }

  void clear(){
    _orders.clear();
  }
}

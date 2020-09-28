import 'package:bookmytrip/models/order_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier {
  OrderModel _order;

  // ignore: unnecessary_getters_setters
  set order(OrderModel value) => _order = value;

  // ignore: unnecessary_getters_setters
  OrderModel get order => _order;
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  Future<void> fetchBookingHistory() async {
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/booking.json';
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    if (data == null) {
      return;
    }
    final List<OrderModel> loadedOrders = [];
    data.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderModel(
          id: orderId,
          hotelName: orderData['hotelName'],
          price: orderData['price'],
          nights: orderData['nights'],
          days: orderData['days'],
          rooms: orderData['rooms'],
          dataTime: DateTime.parse(orderData['dateTime']),
          image: orderData['image'],
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> bookNow(OrderModel orderModel) async {
    final time = DateTime.now();
    final url = 'https://book-my-trip-8b2f5.firebaseio.com/booking.json';
    final response = await http.post(
      url,
      body: json.encode({
        'totalAmount': orderModel.price,
        'hotelName': orderModel.hotelName,
        'price': orderModel.price,
        'nights': orderModel.nights,
        'days': orderModel.days,
        'rooms': orderModel.rooms,
        'dateTime': time.toIso8601String(),
        'image': orderModel.image,
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
        image: orderModel.image,
      ),
    );
    notifyListeners();
  }
}

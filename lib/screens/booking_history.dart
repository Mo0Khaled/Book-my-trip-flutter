import 'package:bookmytrip/provider/order_provider.dart';
import 'package:bookmytrip/widgets/booking_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingHistory extends StatelessWidget {
  static const routeId = '/booking-history';

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Booking History",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: FutureBuilder(
        future: orderProvider.fetchBookingHistory(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: orderProvider.orders.length,
                    itemBuilder: (context, index) => BookingHistoryWidget(
                      orderProvider.orders[index],
                    ),
                  ),
      ),
    );
  }
}

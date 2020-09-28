import 'package:bookmytrip/models/order_model.dart';
import 'package:flutter/material.dart';

class BookingHistoryWidget extends StatelessWidget {
  final OrderModel orderModel;

  BookingHistoryWidget(this.orderModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.30,
        // color: Colors.red,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(orderModel.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderModel.hotelName,
                    style: TextStyle(
                        color: Color(0xFF757575),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${orderModel.nights} nights, ${orderModel.days} days",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Text(
                      "${orderModel.dataTime}",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '\$${orderModel.price}',
                    style: TextStyle(
                      color: Color(0xFFF57C00),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookmytrip/models/order_model.dart';
import 'package:flutter/material.dart';

class BookingHistoryWidget extends StatefulWidget {
  final OrderModel orderModel;

  BookingHistoryWidget(this.orderModel);

  @override
  _BookingHistoryWidgetState createState() => _BookingHistoryWidgetState();
}

class _BookingHistoryWidgetState extends State<BookingHistoryWidget> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      setState(() {
        _visible = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 600),
      padding: _visible ? EdgeInsets.all(15.0) : EdgeInsets.all(0.0) ,
      curve: Curves.easeOutSine,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.28,
        // color: Colors.red,
        child: AnimatedOpacity(
          opacity: _visible ? 1 : 0,
          duration: Duration(milliseconds: 800),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.orderModel.image),
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
                    SizedBox(
                      child: Text(
                        widget.orderModel.hotelName,
                        style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${widget.orderModel.nights} nights, ${widget.orderModel.days} days",
                      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                      child: Text(
                        "${widget.orderModel.dataTime}",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey.shade700),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '\$${widget.orderModel.price}',
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
      ),
    );
  }
}

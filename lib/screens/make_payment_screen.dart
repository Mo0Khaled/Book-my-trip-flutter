import 'package:bookmytrip/provider/order_provider.dart';
import 'package:bookmytrip/screens/successful_page.dart';
import 'package:bookmytrip/widgets/drawer_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MakePaymentScreen extends StatelessWidget {
  static const routeId = '/make-payment';
  final TextStyle _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  final TextStyle _textStyleSmall = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text(
          "Make Payment",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                  color: Color(0xFFF57C00),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Number",
                                style: _textStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "4345 4545 7676 3453",
                                style: _textStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Card Owner",
                            style: _textStyleSmall,
                          ),
                          Spacer(),
                          Text(
                            "Issued",
                            style: _textStyleSmall,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Expire", style: _textStyleSmall),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ronnie Hill", style: _textStyleSmall),
                          Spacer(),
                          Text("06/19", style: _textStyleSmall),
                          SizedBox(
                            width: 15,
                          ),
                          Text("06/22", style: _textStyleSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Add New Card",
                style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Credit Card Number"),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Credit Card Owner"),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Issue On"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(hintText: "Expire On"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await orderProvider
                            .bookNow(orderProvider.orders.first)
                            .then((_) => orderProvider.clear())
                            .then(
                              (_) => Navigator.of(context)
                                  .pushReplacementNamed(SuccessfulPage.routeId),
                            );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 1 - 20,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFFF57C00),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                          "Add New Card",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
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

import 'package:bookmytrip/widgets/drawer_app.dart';
import 'package:flutter/material.dart';

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
                          Text("Card Owner",style: _textStyleSmall,),
                          Spacer(),
                          Text("Issued",style: _textStyleSmall,),
                          SizedBox(width: 15,),
                          Text("Expire",style: _textStyleSmall),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ronnie Hill",style: _textStyleSmall),
                          Spacer(),
                          Text("06/19",style: _textStyleSmall),
                          SizedBox(width: 15,),
                          Text("06/22",style: _textStyleSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Add New Card",style: TextStyle(color: Color(0xFF757575),fontSize: 22,fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),
              Form(
                child: Column(

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

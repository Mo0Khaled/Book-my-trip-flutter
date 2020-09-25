import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/screens/make_payment_screen.dart';
import 'package:bookmytrip/widgets/drawer_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelDirectionsScreen extends StatelessWidget {
  static const routeId = '/hotel-directions';

  @override
  Widget build(BuildContext context) {
    final hotelId = ModalRoute.of(context).settings.arguments as String;
    final hotelProvider =
        Provider.of<HotelProvider>(context, listen: false).findById(hotelId);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text("Hotel Directions",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height * 0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(hotelProvider.baseImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotelProvider.hotelName,
                          style: TextStyle(
                              color: Color(0xFF757575), fontSize: 20, fontWeight: FontWeight.w600,letterSpacing: 1.2),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            hotelProvider.location,
                            style: TextStyle(
                                color: Colors.grey, fontSize: 16, height: 1.5),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          hotelProvider.phoneNumber.toString(),
                          style: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 1.2),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/Map.png'),fit: BoxFit.cover)
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MakePaymentScreen.routeId);
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width* 1 - 20,
                height:MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: Color(0xFFF57C00),
                    borderRadius: BorderRadius.circular(35)),
                child: Text(
                  "Continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

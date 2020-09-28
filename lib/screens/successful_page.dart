import 'package:bookmytrip/screens/home_page.dart';
import 'package:flutter/material.dart';

class SuccessfulPage extends StatelessWidget {
  static const routeId = '/success';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/Bit.png',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.3),
        ),
        Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                  color: Color(0xFFF57C00).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/Check.png',
                    fit: BoxFit.cover,
                    height:  MediaQuery.of(context).size.height * 0.2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Your Payment is successful. Your bookingis confirmed now. All the details are senton your provided email id.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(HomePage.routeId);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 2,color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Text(
                        "Ok",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

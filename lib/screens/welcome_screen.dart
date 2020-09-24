import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:bookmytrip/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeId = '/welcome-screen';
  @override
  Widget build(BuildContext context) {
    final widthMedia = MediaQuery.of(context).size.width;
    final heightMedia = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/Bitmap.png',
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.3),
        ),
       Scaffold(
         body:Stack(
           children: [
             Positioned(
               left: widthMedia / 4,
               top: heightMedia / 6,
               child: Text(
                 "BookMyTrip",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 35,
                   fontWeight: FontWeight.w500,
                 ),
               ),
             ),
             Positioned(
               top: heightMedia / 2 - 50,
               left: widthMedia / 7,
               width: widthMedia * 0.7,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     "Book your room today and get amazing discounts",
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       height: 1.5,
                       color: Colors.white,
                       fontSize: 20,
                       fontWeight: FontWeight.w400,
                     ),
                   ),
                 ],
               ),
             ),
             Positioned(
               top: heightMedia - 200,
               left: widthMedia * 0.03,
               child: Column(
                 children: [
                   GestureDetector(
                     onTap: () {
                       Navigator.of(context).pushReplacementNamed(SignInScreen.routeId);
                     },
                     child: Container(
                       alignment: Alignment.center,
                       width: widthMedia * 1 - 20,
                       height: heightMedia * 0.07,
                       decoration: BoxDecoration(
                           color: Color(0xFFF57C00),
                           borderRadius: BorderRadius.circular(35)),
                       child: Text(
                         "Sign In",
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.white, fontSize: 20),
                       ),
                     ),
                   ),
                   SizedBox(
                     height: 25,
                   ),
                   GestureDetector(
                     onTap: () {
                       Navigator.of(context).pushReplacementNamed(SignUpScreen.routeId);
                     },
                     child: Container(
                       alignment: Alignment.center,
                       width: widthMedia * 1 - 20,
                       height: heightMedia * 0.07,
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         border: Border.all(width: 2,color: Colors.white),
                         borderRadius: BorderRadius.circular(35),
                       ),
                       child: Text(
                         "Sign Up",
                         textAlign: TextAlign.center,
                         style: TextStyle(color: Colors.white, fontSize: 18),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ],
         ),
       )
      ],
    );
  }
}

import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeId = '/sign-up-screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final widthMedia = MediaQuery.of(context).size.width;
    final heightMedia = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/Bitmap-2.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF555555).withOpacity(0.2),
        ),
        Scaffold(
          body: Stack(
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
                top: heightMedia / 3 - 50,
                left: widthMedia / 7,
                width: widthMedia * 0.7,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Email",
                          focusColor: Colors.red,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          focusColor: Colors.red,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusColor: Colors.red,
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: heightMedia - 200,
                left: widthMedia * 0.03,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: widthMedia * 1 - 20,
                        height: heightMedia * 0.07,
                        decoration: BoxDecoration(
                            color: Color(0xFFF57C00),
                            borderRadius: BorderRadius.circular(35)),
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.routeId),
                      child: Text(
                        "Already a Member? Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

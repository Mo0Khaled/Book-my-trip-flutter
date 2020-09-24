import 'package:bookmytrip/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const routeId = '/sign-in-screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final widthMedia = MediaQuery.of(context).size.width;
    final heightMedia = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/Bitmap-1.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF555555).withOpacity(0.6),
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
                top: heightMedia / 2 - 50,
                left: widthMedia / 7,
                width: widthMedia * 0.7,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "Email Or Phone",
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
                        height: 20,
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
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.routeId),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

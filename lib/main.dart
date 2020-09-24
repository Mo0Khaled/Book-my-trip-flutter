import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:bookmytrip/screens/sign_up_screen.dart';
import 'package:bookmytrip/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book My Trip App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFF57C00),
          centerTitle: true,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.transparent,
        disabledColor: Colors.white,
        cursorColor: Colors.white,
        indicatorColor: Colors.white,
        primaryColor: Color(0xFFF57C00),
        accentColor: Colors.white,
        buttonColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeId :(context) => WelcomeScreen(),
        SignInScreen.routeId: (context) => SignInScreen(),
        SignUpScreen.routeId:(context) => SignUpScreen(),
      },
    );
  }
}

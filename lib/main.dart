import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/screens/home_page.dart';
import 'package:bookmytrip/screens/hotel_admin_panel.dart';
import 'package:bookmytrip/screens/hotel_admin_view.dart';
import 'package:bookmytrip/screens/hotel_details_screen.dart';
import 'package:bookmytrip/screens/hotel_directions_screen.dart';
import 'package:bookmytrip/screens/make_payment_screen.dart';
import 'package:bookmytrip/screens/profile_screen.dart';
import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:bookmytrip/screens/sign_up_screen.dart';
import 'package:bookmytrip/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HotelProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book My Trip App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFFF57C00),
            iconTheme: IconThemeData(color: Colors.white),
            // textTheme: TextTheme(title:  ),
            centerTitle: true,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.transparent,
          disabledColor: Colors.white,
          cursorColor: Colors.white,
          indicatorColor: Colors.white,
          primaryColor: Color(0xFFF57C00),
          buttonColor: Colors.white,

          accentColor: Colors.white,
          // buttonColor: Colors.white,
        ),
        // home: WelcomeScreen(),
        initialRoute: HomePage.routeId,
        routes: {
          HomePage.routeId: (context) => HomePage(),
          WelcomeScreen.routeId: (context) => WelcomeScreen(),
          SignInScreen.routeId: (context) => SignInScreen(),
          SignUpScreen.routeId: (context) => SignUpScreen(),
          HotelDetailsScreen.roueId:(context)=> HotelDetailsScreen(),
          HotelDirectionsScreen.routeId:(context)=> HotelDirectionsScreen(),
          MakePaymentScreen.routeId:(context)=> MakePaymentScreen(),
          ProfileScreen.routeId:(context)=> ProfileScreen(),
          HotelAdminView.routeId:(context)=> HotelAdminView(),
          HotelAdminPanel.routeId:(context)=> HotelAdminPanel(),
        },
      ),
    );
  }
}

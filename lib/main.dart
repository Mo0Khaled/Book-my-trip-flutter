import 'package:bookmytrip/provider/authentication.dart';
import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/provider/order_provider.dart';
import 'package:bookmytrip/screens/booking_history.dart';
import 'package:bookmytrip/screens/home_page.dart';
import 'package:bookmytrip/screens/hotel_admin_panel.dart';
import 'package:bookmytrip/screens/hotel_admin_view.dart';
import 'package:bookmytrip/screens/hotel_details_screen.dart';
import 'package:bookmytrip/screens/hotel_directions_screen.dart';
import 'package:bookmytrip/screens/loading_screen.dart';
import 'package:bookmytrip/screens/make_payment_screen.dart';
import 'package:bookmytrip/screens/profile_screen.dart';
import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:bookmytrip/screens/sign_up_screen.dart';
import 'package:bookmytrip/screens/successful_page.dart';
import 'package:bookmytrip/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool  seen = prefs.getBool('seen');
  Widget _screen ;
  if(seen == null || seen == false){
    _screen = WelcomeScreen();
  }else{
    _screen = SignInScreen();
  }
  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  final Widget screen;

  MyApp(this.screen);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),

        ChangeNotifierProxyProvider<Authentication,HotelProvider>(
          update: (ctx,auth,hotels) => HotelProvider(auth.token,hotels.hotels == null ? [] : hotels.hotels),
          create: (context) => HotelProvider('', []),

        ),
        ChangeNotifierProxyProvider<Authentication,OrderProvider>(
          update: (ctx,auth,orders)=> OrderProvider(auth.token,auth.userId, orders.orders == null ? [] : orders.orders),
          create: (context) => OrderProvider('','',[]),
        ),

      ],
      child: Consumer<Authentication>(
        builder: (context, auth, _) => MaterialApp(
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
            // ignore: deprecated_member_use
            cursorColor: Colors.white,
            indicatorColor: Colors.white,
            primaryColor: Color(0xFFF57C00),
            buttonColor: Colors.white,

            accentColor: Colors.white,
            // buttonColor: Colors.white,
          ),
          home: auth.isAuth ? HomePage() : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (context,snapshot)=> snapshot.connectionState == ConnectionState.waiting ? LoadingScreen(): screen,
          ),
          // initialRoute: HomePage.routeId,
          routes: {
            HomePage.routeId: (context) => HomePage(),
            WelcomeScreen.routeId: (context) => WelcomeScreen(),
            SignInScreen.routeId: (context) => SignInScreen(),
            SignUpScreen.routeId: (context) => SignUpScreen(),
            HotelDetailsScreen.roueId: (context) => HotelDetailsScreen(),
            HotelDirectionsScreen.routeId: (context) => HotelDirectionsScreen(),
            MakePaymentScreen.routeId: (context) => MakePaymentScreen(),
            ProfileScreen.routeId: (context) => ProfileScreen(),
            HotelAdminView.routeId: (context) => HotelAdminView(),
            HotelAdminPanel.routeId: (context) => HotelAdminPanel(),
            SuccessfulPage.routeId: (context) => SuccessfulPage(),
            BookingHistory.routeId: (context) => BookingHistory(),
          },
        ),
      ),
    );
  }
}

import 'package:bookmytrip/provider/authentication.dart';
import 'package:bookmytrip/screens/booking_history.dart';
import 'package:bookmytrip/screens/hotel_admin_view.dart';
import 'package:bookmytrip/screens/profile_screen.dart';
import 'package:bookmytrip/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Leroy Cain",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                accountEmail: Text("Hotel Manager",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                currentAccountPicture: Image.asset(
                  'assets/images/Bitmap.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(height: 30,),
            buildTitlePage(
                title: "Account", icon: Icons.account_circle, onPressed: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeId);
            }),
            buildTitlePage(
                title: "Bookings", icon: Icons.book, onPressed: () {
              Navigator.of(context).pushNamed(BookingHistory.routeId);
            }),
            buildTitlePage(
                title: "Transactions", icon: Icons.attach_money, onPressed: () {}),
            buildTitlePage(
                title: "Wallet", icon: Icons.account_balance_wallet, onPressed: () {}),
            buildTitlePage(
                title: "Messages", icon: Icons.message_sharp, onPressed: () {}),
            buildTitlePage(
                title: "Invite & Earn", icon: Icons.people, onPressed: () {}),
            buildTitlePage(
                title: "Settings", icon: Icons.settings, onPressed: () {
              Navigator.of(context).pushNamed(HotelAdminView.routeId);
            }),
            buildTitlePage(
                title: "Logout", icon: Icons.logout, onPressed: () {
                  Navigator.of(context).pop();

                Provider.of<Authentication>(context,listen: false).logout();
                Navigator.of(context).pushReplacementNamed(SignInScreen.routeId);
            }),
          ],
        ),
      ),
    );
  }

  FlatButton buildTitlePage({String title, IconData icon, Function onPressed}) {
    return FlatButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
        ),
      ),
    );
  }
}

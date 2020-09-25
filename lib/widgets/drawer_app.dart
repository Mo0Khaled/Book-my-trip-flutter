import 'package:bookmytrip/screens/profile_screen.dart';
import 'package:flutter/material.dart';

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
                title: "Bookings", icon: Icons.book, onPressed: () {}),
            buildTitlePage(
                title: "Transactions", icon: Icons.attach_money, onPressed: () {}),
            buildTitlePage(
                title: "Wallet", icon: Icons.account_balance_wallet, onPressed: () {}),
            buildTitlePage(
                title: "Messages", icon: Icons.message_sharp, onPressed: () {}),
            buildTitlePage(
                title: "Invite & Earn", icon: Icons.people, onPressed: () {}),
            buildTitlePage(
                title: "Settings", icon: Icons.settings, onPressed: () {}),
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

import 'package:bookmytrip/screens/hotel_admin_panel.dart';
import 'package:flutter/material.dart';

class HotelAdminView extends StatelessWidget {
  static const routeId = '/hotel-admin-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Mange Hotels",style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.of(context).pushNamed(HotelAdminPanel.routeId);
          }),
        ],
      ),
    );
  }
}

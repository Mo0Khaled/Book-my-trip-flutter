import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/screens/hotel_admin_panel.dart';
import 'package:bookmytrip/widgets/hotel_admin_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelAdminView extends StatelessWidget {
  static const routeId = '/hotel-admin-view';

  @override
  Widget build(BuildContext context) {
    final hotelProvider = Provider.of<HotelProvider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mange Hotels",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(HotelAdminPanel.routeId);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: Color(0xFFF57C00),
        onRefresh: ()=>hotelProvider.fetchHotels(),
        child: ListView.builder(
          itemCount: hotelProvider.hotels.length,
          itemBuilder: (context,index)=> HotelAdminViewWidget(
            id:hotelProvider.hotels[index].id ,
            hotelName:hotelProvider.hotels[index].hotelName,
            baseImage: hotelProvider.hotels[index].baseImage,
          ),
        ),
      ),
    );
  }
}

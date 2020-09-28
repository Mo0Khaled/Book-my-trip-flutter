import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/screens/hotel_admin_panel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelAdminViewWidget extends StatelessWidget {
  final String id;
  final String hotelName;
  final String baseImage;

  HotelAdminViewWidget({this.hotelName, this.baseImage,this.id});

  @override
  Widget build(BuildContext context) {
    final hotelProvider = Provider.of<HotelProvider>(context,listen: false);
    return ListTile(
      title: Text(hotelName),
      leading: CircleAvatar(backgroundImage: NetworkImage(baseImage)),
      trailing: Container(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: ()=>Navigator.of(context).pushNamed(HotelAdminPanel.routeId,arguments: id)),
            IconButton(icon: Icon(Icons.delete), onPressed: ()=>hotelProvider.deleteHotel(id))
          ],
        ),
      ),
    );
  }
}

import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:bookmytrip/screens/hotel_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final hotelProvider = Provider.of<HotelProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: FutureBuilder(
        future: hotelProvider.fetchHotels(),
        builder:(context,snapshot)=> snapshot.connectionState == ConnectionState.waiting ? Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: hotelProvider.hotels.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(HotelDetailsScreen.roueId,
                        arguments: hotelProvider.hotels[index].id);
                  },
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.29,
                    // color: Colors.orange,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image:
                            NetworkImage(hotelProvider.hotels[index].baseImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7, left: 15),
                          child: Text(
                            hotelProvider.hotels[index].hotelName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 15),
                          child: Text(
                            "\$${hotelProvider.hotels[index].dayPrice}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

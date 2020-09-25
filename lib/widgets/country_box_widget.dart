import 'package:flutter/material.dart';

class CountryBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 60,
          height: 130,
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Bitmap.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "New York",
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
    );
  }
}

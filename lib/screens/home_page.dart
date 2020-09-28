import 'package:bookmytrip/widgets/country_box_widget.dart';
import 'package:bookmytrip/widgets/drawer_app.dart';
import 'package:bookmytrip/widgets/hotel_container.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){setState(() {
      _visible = true;
    });});
  }
  @override
  Widget build(BuildContext context) {
    // final widthMedia = MediaQuery.of(context).size.width;
    final heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: AnimatedPadding(
                duration: Duration(milliseconds: 600),
                curve: Curves.ease,
                padding: _visible ? EdgeInsets.all(15.0) : EdgeInsets.all(0.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  height: heightMedia * 0.07,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    border: Border.all(width: 2, color: Color(0xFFF57C00)),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xFFF57C00),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(color: Color(0xFFF57C00), fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _visible ? 1:0,
              duration: Duration(milliseconds: 800),
              child: Container(
                width: double.infinity,
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CountryBoxWidget(),
                    CountryBoxWidget(),
                    CountryBoxWidget(),
                    CountryBoxWidget(),
                    CountryBoxWidget(),
                    CountryBoxWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Hotels",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "View More",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF757575),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: _visible ? 1:0,
              duration: Duration(seconds: 4),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1,
                child: HotelContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

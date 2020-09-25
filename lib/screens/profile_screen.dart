import 'package:bookmytrip/widgets/drawer_app.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeId = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: MediaQuery.of(context).size.height * 0.22,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white70,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            // SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "Full Name"),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: InputDecoration(hintText: "Phone Number"),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(hintText: "City"),
                      keyboardType: TextInputType.name,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width* 1 - 20,
                height:MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: Color(0xFFF57C00),
                    borderRadius: BorderRadius.circular(35)),
                child: Text(
                  "Save Changes",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

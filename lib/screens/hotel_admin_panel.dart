import 'dart:io';

import 'package:bookmytrip/models/hotel_model.dart';
import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class HotelAdminPanel extends StatefulWidget {
  static const routeId = '/hotel-admin-panel';

  @override
  _HotelAdminPanelState createState() => _HotelAdminPanelState();
}

class _HotelAdminPanelState extends State<HotelAdminPanel> {
  final _formKey = GlobalKey<FormState>();
  var _hotelItem = HotelModel(
    id: null,
    hotelName: '',
    baseImage: null,
    images: [] ,
    dayPrice: 0,
    description: '',
    location: '',
    phoneNumber: 0,
  );

  var _initialValue = {
    'hotelName': '',
    'baseImage': '',
    'images': '',
    'dayPrice': '',
    'description': '',
    'location': '',
    'phoneNumber': '',
  };

  Future<void> uploadImages()async{

  }
  void saveForm() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    if (_hotelItem.id != null) {
      Provider.of<HotelProvider>(context, listen: false)
          .updateHotel(_hotelItem.id, _hotelItem);
    } else {
      Provider.of<HotelProvider>(context, listen: false).addHotel(_hotelItem);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edited Hotels",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: saveForm)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _initialValue['hotelName'],
                decoration: InputDecoration(hintText: "Hotel Name"),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter a Hotel Name";
                  } else if (value.length < 2) {
                    return "Please Enter a valid name";
                  }
                  return null;
                },
                onSaved: (value) {
                  _hotelItem = HotelModel(
                    id: _hotelItem.id,
                    hotelName: value,
                    baseImage: _hotelItem.baseImage,
                    images: _hotelItem.images,
                    dayPrice: _hotelItem.dayPrice,
                    description: _hotelItem.description,
                    location: _hotelItem.location,
                    phoneNumber: _hotelItem.phoneNumber,
                  );
                },
              ),
              TextFormField(
                initialValue: _initialValue['dayPrice'],
                decoration: InputDecoration(hintText: "Day Price"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter a price";
                  }
                  return null;
                },
                onSaved: (value) {
                  _hotelItem = HotelModel(
                    id: _hotelItem.id,
                    hotelName: _hotelItem.hotelName,
                    baseImage: _hotelItem.baseImage,
                    images: _hotelItem.images,
                    dayPrice: double.parse(value),
                    description: _hotelItem.description,
                    location: _hotelItem.location,
                    phoneNumber: _hotelItem.phoneNumber,
                  );
                },
              ),
              TextFormField(
                initialValue: _initialValue['description'],
                decoration: InputDecoration(hintText: "Description",),
                keyboardType: TextInputType.multiline,
                maxLength: 300,
                maxLines: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter a description";
                  }
                  return null;
                },
                onSaved: (value) {
                  _hotelItem = HotelModel(
                    id: _hotelItem.id,
                    hotelName: _hotelItem.hotelName,
                    baseImage: _hotelItem.baseImage,
                    images: _hotelItem.images,
                    dayPrice: _hotelItem.dayPrice,
                    description:value,
                    location: _hotelItem.location,
                    phoneNumber: _hotelItem.phoneNumber,
                  );
                },
              ),
              TextFormField(
                initialValue: _initialValue['location'],
                decoration: InputDecoration(hintText: "Location"),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter a Location Direction";
                  }
                  return null;
                },
                onSaved: (value) {
                  _hotelItem = HotelModel(
                    id: _hotelItem.id,
                    hotelName: _hotelItem.hotelName,
                    baseImage: _hotelItem.baseImage,
                    images: _hotelItem.images,
                    dayPrice: _hotelItem.dayPrice,
                    description: _hotelItem.description,
                    location: value,
                    phoneNumber: _hotelItem.phoneNumber,
                  );
                },
              ),
              TextFormField(
                initialValue: _initialValue['phoneNumber'],
                decoration: InputDecoration(hintText: "Phone Number"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter a Phone Number";
                  }
                  return null;
                },
                onSaved: (value) {
                  _hotelItem = HotelModel(
                    id: _hotelItem.id,
                    hotelName: _hotelItem.hotelName,
                    baseImage: _hotelItem.baseImage,
                    images: _hotelItem.images,
                    dayPrice: _hotelItem.dayPrice,
                    description: _hotelItem.description,
                    location: _hotelItem.location,
                    phoneNumber: int.parse(value),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

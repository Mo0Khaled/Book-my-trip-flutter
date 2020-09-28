import 'dart:io';
import 'dart:math';

import 'package:bookmytrip/models/hotel_model.dart';
import 'package:bookmytrip/provider/hotel_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<Asset> images = List<Asset>();
  File _image;
  final picker = ImagePicker();
  var _hotelItem = HotelModel(
    id: null,
    hotelName: '',
    baseImage: '',
    images: [],
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
  var _isInit = true;

  Future<String> uploadImages(Asset image) async {
    String name = Random().nextInt(10000).toString() + "_images";
    final StorageReference storageReference =
        FirebaseStorage().ref().child(name);
    ByteData byteData = await image.getByteData();
    List<int> imageData = byteData.buffer.asUint8List();
    final StorageUploadTask uploadTask = storageReference.putData(imageData);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    return url;
  }
  Future<String> uploadBaseImage(File image) async {
    String name = Random().nextInt(10000).toString() + "_images";
    final StorageReference storageReference =
    FirebaseStorage().ref().child(name);
    final StorageUploadTask uploadTask = storageReference.putFile(image);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    return url;
  }
  Future getImages() async {
    setState(() {
      images = List<Asset>();
    });
    List<Asset> resultList;
    resultList = await MultiImagePicker.pickImages(
      materialOptions: MaterialOptions(lightStatusBar: true),
      selectedAssets: images,
      maxImages: 5,
    );
    setState(() {
      images = resultList;
    });
  }
  Future getBaseImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }


  @override
  void didChangeDependencies() {
      if(_isInit){
        final hotelId = ModalRoute.of(context).settings.arguments as String;
        if(hotelId != null){
          _hotelItem = Provider.of<HotelProvider>(context).findById(hotelId);
          _initialValue = {
            'hotelName': _hotelItem.hotelName,
            'baseImage': _hotelItem.baseImage,
            'images': _hotelItem.images.toString(),
            'dayPrice': _hotelItem.dayPrice.toString(),
            'description': _hotelItem.description,
            'location': _hotelItem.location,
            'phoneNumber': _hotelItem.phoneNumber.toString(),
          };
        }
      }
      _isInit = false;
    super.didChangeDependencies();

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
  var _isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Edited Hotels",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(icon:_isLoading ? CircularProgressIndicator():  Icon(Icons.save), onPressed: _isLoading ? (){
       return _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("We Are Uploading"),));
        } :saveForm)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
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
                decoration: InputDecoration(
                  hintText: "Description",
                ),
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
                    description: value,
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
              SizedBox(
                height: 20,
              ),
              Text("add your resturant images"),
              RaisedButton(
                child: Text("add images"),
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await getImages();
                   for(var img in images){
                     String url = await uploadImages(img);
                     _hotelItem.images.add(url);
                   }
                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text("add your base image"),
              RaisedButton(
                onPressed: () async {
                  setState(() {
                    _isLoading = true;
                  });
                    await getBaseImage().then((value) async{
                      String url = await uploadBaseImage(_image);
                      _hotelItem.baseImage = url;
                    }).whenComplete(() {
                      setState(() {
                        _isLoading = false;
                      });
                    });

                },
                child: Text("add image"),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

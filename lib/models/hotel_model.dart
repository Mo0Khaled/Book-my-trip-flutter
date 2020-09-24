class HotelModel {
  String id;
  String hotelName;
  String baseImage;
  List<String> images;
  double dayPrice;
  String description;
  String location;
  int phoneNumber;

  HotelModel({
    this.id,
    this.hotelName,
    this.baseImage,
    this.images,
    this.dayPrice,
    this.description,
    this.location,
    this.phoneNumber,
  });

  HotelModel fromJson(Map<String, dynamic> data) {
    return HotelModel(
      id: data['id'],
      baseImage: data['baseImage'],
      dayPrice: data['dayPrice'],
      description: data['description'],
      hotelName: data['hotelName'],
      images: data['images'] as List,
      location: data['location'],
      phoneNumber: data['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['baseImage'] = this.baseImage;
    data['dayPrice'] = this.dayPrice;
    data['description'] = this.description;
    data['hotelName'] = this.hotelName;
    data['images'] = this.images;
    data['location'] = this.location;
    data['phoneNumber'] = this.phoneNumber;
  }
}

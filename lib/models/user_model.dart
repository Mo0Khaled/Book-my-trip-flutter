class UserModel {
  String id;
  String image;
  String name;
  String email;
  int phoneNum;
  String city;

  UserModel({
    this.id,
    this.image,
    this.name,
    this.email,
    this.phoneNum,
    this.city,
  });

  UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      email: data['email'],
      city: data['city'],
      phoneNum: data['phone_num'],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String image;
  String name;
  String username;
  String password;
  String phone;
  String key;

  UserModel({this.image, this.name, this.username, this.password,this.phone, this.key});

  UserModel.fromJson(DocumentSnapshot snapshot) {
    final json = snapshot.data();
    key = snapshot.id;
    image = json["image"];
    name = json["name"];
    username = json["email"];
    password = json["password"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json["image"] = image;
    json["name"] = name;
    json["email"] = username;
    json["password"] = password;
    json["phone"] = phone;

    return json;
  }
}



import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String image;
  String name;


  CategoryModel({this.image,this.name});

  CategoryModel.fromJson(DocumentSnapshot snapshot){
    final json = snapshot.data();
    image = json['image'];
    name =  json['name'];

  }

  Map<String,dynamic> toJson(){
    var json = <String,dynamic>{};
    json["image"] = image;
    json["name"]  = name ;

    return json;
  }

}

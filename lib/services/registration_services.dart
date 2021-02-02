import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_products/models/user.dart';
import 'package:my_products/services/auth_services.dart';

class SignUpServices{
  AuthServices _authServices = new AuthServices();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<UserModel> register(UserModel userModel, String image) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.username, password: userModel.password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await addNewUser(userModel, image);
    _authServices.updateSecureStorage(createdUser);
    return createdUser;
  }


  Future<UserModel> addNewUser(UserModel userModel, String image) async {
    if (image != null && image.isNotEmpty) {
      userModel.image = await uploadImage(image, "123456");
    }
    final ref = await _fireStore.collection("users").add(userModel.toJson());
    userModel.key = ref.id;
    return userModel;
  }


  Future<String> uploadImage(String imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final url = (await (await uploadTask).ref.getDownloadURL()).toString();
    return url;
  }
}
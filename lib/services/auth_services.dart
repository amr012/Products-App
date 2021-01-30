import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_products/models/user.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FlutterSecureStorage();

  Future<UserModel> register(UserModel userModel, String image) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userModel.username, password: userModel.password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await addNewUser(userModel, image);
    updateSecureStorage(createdUser);
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

  Future<UserModel> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUSer = await getUserByEmail(email);
    updateSecureStorage(createdUSer);
    return createdUSer;
  }

  updateSecureStorage(UserModel userModel) async {
    await _storage.write(key: "user", value: userModel.key);
  }

  Future<UserModel> getUserByEmail(String email) async {
    final data = await _fireStore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromJson(data.docs.first);
    } else {
      throw "Error at Loading Information";
    }
  }

  Future<UserModel> getCurrentUser() async {
    final userKey = await _storage.read(key: "user");
    if (userKey == null) {
      return null;
    } else {
      return UserModel.fromJson(
          await _fireStore.collection("users").doc(userKey).get());
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _storage.delete(key: "user");
  }
}

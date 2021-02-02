
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_products/controllers/auth_controller.dart';
import 'package:my_products/models/user.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final _storage = FlutterSecureStorage();


  updateSecureStorage(UserModel userModel) async {
    await _storage.write(key: "user", value: userModel.key);
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
    AuthController.to.changeLoggedIn(false, null);
  }
}

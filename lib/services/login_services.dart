import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_products/models/user.dart';

import 'auth_services.dart';

class LoginServices{

  AuthServices _authServices = new AuthServices();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;



  Future<UserModel> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUSer = await getUserByEmail(email);
   _authServices.updateSecureStorage(createdUSer);
    return createdUSer;
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
}
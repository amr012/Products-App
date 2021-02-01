import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_products/controllers/auth_controller.dart';
import 'package:my_products/controllers/base_controller.dart';
import 'package:my_products/models/user.dart';
import 'package:my_products/models/validation_item.dart';
import 'package:my_products/services/auth_services.dart';
import 'package:my_products/utilis/utility.dart';
import 'package:permission_handler/permission_handler.dart';

class SignUpController extends BaseController {
  AuthServices authServices = new AuthServices();

  final _image = Rx<String>();
  final _name = ValidationItem().obs;
  final _userName = ValidationItem().obs;
  final _password = ValidationItem().obs;
  final _phone = ValidationItem().obs;
  final _picker = ImagePicker();
  RxBool _saving = false.obs;

  String get image => _image.value;

  ValidationItem get name => _name.value;

  ValidationItem get userName => _userName.value;

  ValidationItem get password => _password.value;

  ValidationItem get phone => _phone.value;

  bool get saving => _saving.value;

  void changeImage(String image) {
    _image.value = image;
  }

  void changeName(String name) {
    if (name.trim().length < 3) {
      _name.value =
          ValidationItem(error: "يجب ان يتكون الاسم من اكثر من 3 حروف");
    } else {
      _name.value = ValidationItem(value: name);
    }
  }

  void changeUserName(String userName) {
    if (userName.trim().length < 3) {
      _userName.value =
          ValidationItem(error: "يجب ان يتكون الاسم من اكثر من 3 حروف");
    } else {
      _userName.value = ValidationItem(value: userName);
    }
  }

  void changePassword(String password) {
    if (password.trim().length < 7) {
      _password.value = ValidationItem(error: "يجب ان يكون اكبر من 7 حروف");
    } else {
      _password.value = ValidationItem(value: password);
    }
  }

  void changePhone(String phone) {
    if (phone.trim().length != 11) {
      _phone.value = ValidationItem(error: "يحب ان يكون رقم الهاتف من 11 رقم ");
    } else {
      _phone.value = ValidationItem(value: phone);
    }
  }

  // Future<void> createUser(String email, String password) async {
  //   try{
  //    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //
  //   }
  //   catch(e){
  //     print(e.toString());
  //   }
  // }

  registerValidation(BuildContext context) async {
    if (_name.value.isValid() &&
        _userName.value.isValid() &&
        _password.value.isValid() &&
        _phone.value.isValid() && EmailValidator.validate(_userName.value.value)) {
      _saving.value = true;
      UserModel user = await authServices.register(
          UserModel(
              name: name.value,
              username: userName.value,
              password: password.value,
              phone: phone.value,
              image: image),
          image);
      _saving.value = false;
      AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "تاكد من ادخال القيم بشكل صحيح", "خطأ بالادخال", context);
    }
  }

  Future<bool> requestImagePermission() async {
    final permissions = await [Permission.storage, Permission.photos].request();
    if (Platform.isAndroid && permissions[Permission.storage].isGranted) {
      return true;
    } else if (Platform.isIOS && permissions[Permission.photos].isGranted) {
      return true;
    }
    return false;
  }

  getImage() async {
    final state = await requestImagePermission();
    if (state) {
      try {
        PickedFile pickedFile =
            await _picker.getImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          _image.value = pickedFile.path;
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Must Be Allow!!");
    }
  }
}

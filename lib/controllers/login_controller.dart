import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_products/controllers/auth_controller.dart';
import 'package:my_products/models/user.dart';
import 'package:my_products/models/validation_item.dart';
import 'package:my_products/services/login_services.dart';
import 'package:my_products/utilis/utility.dart';

class LoginController {
  LoginServices _loginServices = new LoginServices();
  final _userName = ValidationItem().obs;
  final _password = ValidationItem().obs;
  final _isSaving = false.obs;

  ValidationItem get userName => _userName.value;

  ValidationItem get password => _password.value;

  bool get saving => _isSaving.value;

  changeEmail(String email) {
    if (email.trim().length < 3) {
      _userName.value =
          ValidationItem(error: "Email Should not be less than 3 letters");
    } else {
      _userName.value = ValidationItem(value: email);
    }
  }

  changePassword(String password) {
    if (password.trim().length < 6) {
      _password.value =
          ValidationItem(error: "Password Should not be less than 6 letters");
    } else {
      _password.value = ValidationItem(value: password);
    }
  }

  loginValidation(BuildContext context) async {
    if (_userName.value.isValid() &&
        _password.value.isValid() &&
        EmailValidator.validate(_userName.value.value)) {
      _isSaving.value = true;
      UserModel user = await _loginServices.login(
          _userName.value.value, _password.value.value);
      _isSaving.value = false;
      AuthController.to.changeLoggedIn(true, user);
    } else {
      Utility.displayErrorAlert(
          "The Data You Entered Is Not Correct!", "Validation Error", context);
    }
  }
}

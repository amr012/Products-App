import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_products/components/custom_textt_field.dart';
import 'package:my_products/components/custon_button.dart';
import 'package:my_products/controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(()=>ModalProgressHUD(
          inAsyncCall: _controller.saving,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 10),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(80),
                    child: Obx(() => Container(
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: RawMaterialButton(
                        onPressed: () {
                          _controller.getImage();
                        },
                        child: _controller.image != null
                            ? Image.file(
                          File(_controller.image),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        )
                            : Image.asset("assets/images/camera_icon.png"),
                      ),
                    )),
                  ),
                ),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Obx(() => CustomTextField(
                  onChanged: (v) {
                    _controller.changeName(v);
                  },
                  label: "Name",
                  type: TextInputType.name,
                  errorLabel: _controller.name.error,
                )),
                Obx(() => CustomTextField(
                  onChanged: (v) {
                    _controller.changeUserName(v);
                  },
                  label: "Email",
                  errorLabel: _controller.userName.error,
                  type: TextInputType.emailAddress,
                )),
                Obx(() => CustomTextField(
                  label: "Password",
                  onChanged: (v) {
                    _controller.changePassword(v);
                  },
                  errorLabel: _controller.password.error,
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                )),
                Obx(() => CustomTextField(
                  onChanged: (v) {
                    _controller.changePhone(v);
                  },
                  label: "Phone",
                  errorLabel: _controller.phone.error,
                  type: TextInputType.phone,
                )),
                CustomButton(
                  onPress: () {
                    _controller.registerValidation(context);
                  },
                  text: "Register",
                )
              ],
            ),
          ))),
    );
  }
}

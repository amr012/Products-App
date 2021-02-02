import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:my_products/components/custom_textt_field.dart';
import 'package:my_products/components/custon_button.dart';
import 'package:my_products/constants.dart';
import 'package:my_products/controllers/login_controller.dart';
import 'package:my_products/routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() =>
          ModalProgressHUD(
            inAsyncCall: _controller.saving,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomPaint(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                    ),
                    painter: PainterTest(),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 50,
                        color: K.MAIN_COLOR,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Obx(() =>
                      CustomTextField(
                        backGroundColor: Colors.grey.shade300,
                        label: "Email",
                        type: TextInputType.emailAddress,
                        errorLabel: _controller.userName.error,
                        onChanged: (v) {
                          _controller.changeEmail(v);
                        },
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() =>
                      CustomTextField(
                        backGroundColor: Colors.grey.shade300,
                        label: "Password",
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        errorLabel: _controller.password.error,
                        onChanged: (v) {
                          _controller.changePassword(v);
                        },
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    text: "Login",
                    onPress: () {
                      _controller.loginValidation(context);
                    },
                    color: K.MAIN_COLOR,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 200),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP_SCREEN);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class PainterTest extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    Paint paint = new Paint();
    path.lineTo(0, 80);
    path.quadraticBezierTo(100, 150, 200, 80);
    path.lineTo(200, 80);
    path.quadraticBezierTo(300, 150, 350, 80);
    path.lineTo(300, 0);
    path.quadraticBezierTo(300, 200, 450, 100);
    path.lineTo(450, 0);
    paint.color = Colors.orange;
    canvas.drawPath(path, paint);
    Path path1 = new Path();
    Paint paint1 = new Paint();
    path.lineTo(0, 80);
    path1.quadraticBezierTo(90, 140, 190, 70);
    path1.lineTo(190, 70);
    path1.quadraticBezierTo(280, 130, 320, 60);
    path1.lineTo(290, 0);
    path1.quadraticBezierTo(280, 180, 430, 80);
    path1.lineTo(450, 0);
    paint1.color = K.MAIN_COLOR;
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

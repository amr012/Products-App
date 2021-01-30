
import 'package:get/get.dart';
import 'package:my_products/routes/app_routes.dart';
import 'package:my_products/screens/category_screen.dart';
import 'package:my_products/screens/sign_in_screen.dart';
import 'package:my_products/screens/signup_screen.dart';

class AppScreens{
  static final screens = [
    GetPage(name: Routes.SIGNUP_SCREEN,
      page: ()=>SignUpScreen()),

    GetPage(name: Routes.CATEGORY_SCREEN,
        page: ()=>CategoryScreen()),

    GetPage(name: Routes.SIGNIN_SCREEN,
        page: ()=>SignInScreen())
  ];
}
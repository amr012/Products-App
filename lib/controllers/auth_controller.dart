import 'package:get/get.dart';
import 'package:my_products/controllers/base_controller.dart';
import 'package:my_products/enums/view_state.dart';
import 'package:my_products/models/user.dart';
import 'package:my_products/routes/app_routes.dart';
import 'package:my_products/services/auth_services.dart';
class AuthController extends BaseController {
  static AuthController to = Get.find();
  final _isLogged = false.obs;
  final _currentUser = Rx<UserModel>();
  final _services = new AuthServices();

  bool get isLogged => _isLogged.value;

  UserModel get currentUser => _currentUser.value;

  @override
  void onInit() async {
    super.onInit();
    setState(ViewState.busy);
    ever(_isLogged, handleAuthChanged);
    final user = await _services.getCurrentUser();
    if (user != null) {
      _currentUser.value = user;
      _isLogged.value = true;
    } else {
      _isLogged.value = false;
    }
    setState(ViewState.idle);
  }

  handleAuthChanged(isLoggedIn) async {
    await Future.delayed(Duration(seconds: 1));
    if (isLoggedIn) {
      Get.offAllNamed(Routes.CATEGORY_SCREEN);
    } else {
      Get.offAllNamed(Routes.SIGNUP_SCREEN);
    }
  }

  changeLoggedIn(bool isLoggedIn, UserModel user,) async {
    if (isLoggedIn) {
      _currentUser.value = user;
      Get.offAllNamed(Routes.CATEGORY_SCREEN);
    } else {
      Get.offAllNamed(Routes.SIGNUP_SCREEN);
    }
  }
}
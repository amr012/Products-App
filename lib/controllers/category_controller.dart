
import 'package:my_products/controllers/base_controller.dart';
import 'package:my_products/enums/view_state.dart';
import 'package:my_products/models/category.dart';
import 'package:get/get.dart';
import 'package:my_products/services/category_services.dart';

class CategoryController extends BaseController {

CategoryServices _categoryServices = new CategoryServices();

  final _category = <CategoryModel>[].obs;

  List<CategoryModel> get categoryModel => _category;

  @override
  Future<void> onInit() async {
    super.onInit();
     setState(ViewState.busy);
    _category.assignAll(await _categoryServices.getAllCategory());
    setState(ViewState.idle);
  }

}
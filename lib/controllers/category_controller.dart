import 'package:my_products/controllers/base_controller.dart';
import 'package:my_products/enums/view_state.dart';
import 'package:my_products/models/category.dart';
import 'package:get/get.dart';
import 'package:my_products/services/category_services.dart';

class CategoryController extends BaseController {
  CategoryServices _categoryServices = new CategoryServices();

  final _category = <CategoryModel>[].obs;
  final _categoryFilter = <CategoryModel>[].obs;
  final _isSearched = false.obs;

  List<CategoryModel> get categoryModel => _category;

  List<CategoryModel> get categoryFilter => _categoryFilter;

  bool get isSearching => _isSearched.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setState(ViewState.busy);
    _category.assignAll(await _categoryServices.getAllCategory());
    setState(ViewState.idle);
  }

  onFilter(String value) {
    _categoryFilter.clear();
    if (value.isEmpty) {
       _categoryFilter.add(null);
      _isSearched.value = false;
    } else {
      _isSearched.value = true;
       _categoryFilter.addAll(_category
          .where((e) =>
              e.name.trim().toLowerCase().contains(value.trim().toLowerCase()))
          .toList());
    }
  }
}

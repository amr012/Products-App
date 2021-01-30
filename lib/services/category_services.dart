import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_products/models/category.dart';

class CategoryServices {

  final _fireStore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategory() async {
    final data = await _fireStore.collection('category').get();

    return data.docs.map((e) => CategoryModel.fromJson(e)).toList();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_products/components/custom_category_card.dart';
import 'package:my_products/components/custom_floating_acion_button.dart';
import 'package:my_products/controllers/category_controller.dart';
import 'package:my_products/enums/view_state.dart';

class CategoryScreen extends StatelessWidget {
  final _controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF26A59A),
        title: Text(
          "Category",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
        ],
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: showFab
          ? CustomFloatActionButton(
              onPress: () {
                print(_controller.categoryModel.length);
              },
            )
          : null,
      body: Obx(
        () => (_controller.state == ViewState.busy)
            ? Text("Looding !!")
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 90,
                        child: GridView.builder(
                            itemCount: _controller.categoryModel.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: .75),
                            itemBuilder: (context, index) {
                              return CustomCategoryCard(
                                image: _controller.categoryModel[index].image,
                                productName:
                                    _controller.categoryModel[index].name,
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

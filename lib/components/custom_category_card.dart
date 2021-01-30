import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomCategoryCard extends StatelessWidget {
  CustomCategoryCard({this.image,this.productName});
  final String image ;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(flex: 4,
              child: Image.network(image,fit: BoxFit.fill,)
            ),
            Expanded(flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: AutoSizeText(
                  productName,
                  maxLines: 2,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

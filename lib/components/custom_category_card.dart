import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

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
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                  topRight: Radius.circular(10))
                ),
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      image),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                  ),
                  errorBuilder:(context,url,error){
                    return Image.asset("assets/images/card_image.png");
                  },
                  fit: BoxFit.cover,
                ),
              )
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

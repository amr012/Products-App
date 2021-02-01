import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_products/constants.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;
  LoadingWidget({this.color= K.MAIN_COLOR,this.size=50});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: color,
        size: size,
      ) ,

    );
  }
}

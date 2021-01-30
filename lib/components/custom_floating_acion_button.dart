import 'package:flutter/material.dart';

class CustomFloatActionButton extends StatelessWidget {
  CustomFloatActionButton({this.onPress});
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      backgroundColor: Color(0xFF26A59A),
      child: Icon(Icons.add),
    );
  }
}

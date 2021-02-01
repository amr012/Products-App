import 'package:flutter/material.dart';

class K {
  static const MAIN_COLOR =Color(0xFF26A59A);
  static const textFieldDecoration = InputDecoration(

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide.none));

  static const textFieldTextStyle = TextStyle(fontSize: 16,);
}

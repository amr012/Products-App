
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  final String hintText;
  final Function onChange;
  final Color color;

  TextFieldComponent({this.hintText, this.onChange,this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: TextField(
        onChanged: onChange,
        style: TextStyle(
          height: .4,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18, color:color),
          filled: true,

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

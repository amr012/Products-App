import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color;
  CustomButton({this.color,this.text,this.onPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(width: double.infinity,
        height: 50,

        child: RaisedButton(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,

            ),
          ),
        ),
      ),
    );
  }
}

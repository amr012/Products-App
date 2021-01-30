import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPress;
  CustomButton({this.text,this.onPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(width: double.infinity,
        height: 50,

        child: RaisedButton(
          color: Color(0xFF26A59A),
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

import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;
  EmptyPlaceholder({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Opacity(
              child: Image.asset("assets/images/empty.png"),
              opacity: 0.3,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '$message',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
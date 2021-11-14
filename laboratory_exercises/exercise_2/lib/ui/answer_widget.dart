import 'package:flutter/material.dart';

class ShopAnswerWidget extends StatelessWidget {
  VoidCallback tapped;
  String answerText;

  ShopAnswerWidget({required this.tapped, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: tapped,
            child: Text(answerText, style: TextStyle(color: Colors.red)),
            style: ElevatedButton.styleFrom(primary: Colors.green)));
  }
}

import 'package:flutter/material.dart';

class ShopQuestionWidget extends StatelessWidget {
  String questionContext;

  ShopQuestionWidget({Key? key, required this.questionContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(questionContext,
          textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
    );
  }
}

import 'package:exercise_2/model/question.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'bootstrap/question_base.dart';
import 'ui/question_widget.dart';
import 'ui/answer_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  Logger log = Logger();

  List<Question> questionsList = questions;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _tapped() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % widget.questionsList.length;
    });
    widget.log.i("I was tapped");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "E-shop for clothes",
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
              title: Text("E-shop"),
            ),
            body: Column(
              children: [
                ShopQuestionWidget(
                    questionContext:
                        widget.questionsList[_questionIndex].text!),
                ...widget.questionsList[_questionIndex].answers!.map((answer) {
                  return ShopAnswerWidget(
                      answerText: answer.answer!, tapped: _tapped);
                }).toList()
              ],
            )));
  }
}

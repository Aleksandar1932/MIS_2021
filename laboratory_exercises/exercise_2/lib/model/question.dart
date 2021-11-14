import 'package:exercise_2/model/answer.dart';

class Question {
  String? text;
  List<Answer>? answers;

  Question({this.text, this.answers = const []});
}

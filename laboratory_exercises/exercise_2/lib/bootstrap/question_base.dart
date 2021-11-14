import 'package:exercise_2/model/answer.dart';
import 'package:exercise_2/model/question.dart';

List<Question> questions = [
  Question(
      text: 'Gender',
      answers: [Answer(answer: 'Male'), Answer(answer: 'Female')]),
  Question(text: 'Type of clothes', answers: [
    Answer(answer: 'Coats'),
    Answer(answer: 'Jackets'),
    Answer(answer: 'Blazers'),
    Answer(answer: 'Dresses'),
    Answer(answer: 'Shirts'),
    Answer(answer: 'Jeans'),
  ]),
  Question(text: 'Select size', answers: [
    Answer(answer: 'S'),
    Answer(answer: 'M'),
    Answer(answer: 'L'),
    Answer(answer: 'XL'),
    Answer(answer: 'XXL'),
  ]),
  Question(
      text: 'Your order is recieved!', answers: [Answer(answer: 'Go back')])
];

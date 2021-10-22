import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaboratoryExercise1',
      home: StudentInformation(),
    );
  }
}

class StudentInformation extends StatelessWidget {
  const StudentInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Aleksandar Ivanovski',style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              '186063',style: TextStyle(color: Colors.white, fontSize: 22),
            ),

          ],
        ),
      ),
    );
  }
}
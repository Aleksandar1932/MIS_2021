import 'package:exercise_3/service/auth_service.dart';
import 'package:exercise_3/service/impl/auth_service_impl.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';
import 'auth/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseAuthService _authService = SimpleAuthService();
    return MaterialApp(
      title: 'FCSE Exam Scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _authService.getCurrentUser() != null
          ? const Home(title: 'FCSE Exam Scheduler')
          : Login(),
    );
  }
}


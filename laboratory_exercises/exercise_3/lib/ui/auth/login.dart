import 'package:exercise_3/model/dto/user_dto.dart';
import 'package:exercise_3/service/auth_service.dart';
import 'package:exercise_3/service/impl/auth_service_impl.dart';
import 'package:exercise_3/ui/wrapper.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final BaseAuthService _authService = SimpleAuthService();
  TextEditingController _identifierController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _identifierController,
                decoration: InputDecoration(
                  hintText: 'Username or E-Mail',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () => {
                      _authService.signIn(UserDto(
                          identifier: _identifierController.text,
                          password: _identifierController.text)),
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => App())),
                    },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}

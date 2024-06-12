import 'package:flutter/material.dart';
import 'package:flutter_application_1/RouteGenerator.dart';
import 'package:flutter_application_1/views/TodoList.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.purple[200],
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.purple.shade200)
          ),
          onPressed: (){
            print("login button pressed");
            RouteGenerator.isLoggedIn = true;
            // Navigator.of(context).pushNamed("/");
            Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) => TodoList()));

          },
          child: Text("Login")
        ),
      ),
    );
  }
}
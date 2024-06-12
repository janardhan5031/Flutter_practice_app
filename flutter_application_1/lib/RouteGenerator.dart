import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ErrorPage.dart';
import 'package:flutter_application_1/views/LoginPage.dart';
import 'package:flutter_application_1/views/Note.dart';
import 'package:flutter_application_1/views/TodoList.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Get the arguments passed to the route
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/':
        return MaterialPageRoute(builder: (_) => TodoList());
      // case '/note':
      //   if(args is Object){
      //     return MaterialPageRoute(builder: (_)=>NotePage(data:args));
      //   }
      //   return MaterialPageRoute(builder: (_) => const ErrorPage());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}


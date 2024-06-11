import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Get the arguments passed to the route
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage());
      case '/second':
        if(args is String){
          return MaterialPageRoute(builder: (_) => SecondPage(name:args));
        }
        return MaterialPageRoute(builder: (_)=> ErrorPage());
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdPage());
      default:
        // If there is no such named route in the switch statement, return an error page.
        // You can also throw an exception here or handle it in another way.
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}


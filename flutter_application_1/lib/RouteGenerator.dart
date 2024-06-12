import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/ErrorPage.dart';
import 'package:flutter_application_1/views/LoginPage.dart';
import 'package:flutter_application_1/views/TodoList.dart';


class RouteGenerator {
  static bool isLoggedIn =false;

  static final Map<String, WidgetBuilder> privateRoutes = {
    "/":(_)=> isLoggedIn ? TodoList() : Login(),

    // Add more private routes here
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Get the arguments passed to the route
    final args = settings.arguments;

    // Check if the route is in privateRoutes
    final builder = privateRoutes[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }

    // Handle other routes
    return MaterialPageRoute(builder: (_) => const ErrorPage());
  }
}


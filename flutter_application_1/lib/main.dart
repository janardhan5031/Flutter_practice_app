import 'package:flutter/material.dart';
import 'package:flutter_application_1/RouteGenerator.dart';
import 'package:flutter_application_1/store/task_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>TaskModel()),    // Here we can add no.of models as consumers and providers app
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      initialRoute: "/" ,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


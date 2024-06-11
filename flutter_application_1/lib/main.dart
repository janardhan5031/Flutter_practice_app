import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const FirstPage(),
      routes: {
        "/secondPage": (_)=>const SecondPage(name:"janardhan")
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('First Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("First Page"),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.purple.shade200)),
                onPressed: () {
                  Navigator.of(context).pushNamed("/secondPage");
                },
                child: const Text(
                  'Go to Second Page',
                  style: TextStyle(
                      color: Colors.black), // Set the text color to black
                ),
              )
            ],
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Second Page"),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThirdPage()));
                },
                child: const Text('Go to Third Page'),
              )
            ],
          ),
        ));
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Third Page'),
        ),
        body: GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ThirdPage()),
            // );
          },
          child: const Center(
            child: Text('Third Page'),
          ),
        ));
  }
}

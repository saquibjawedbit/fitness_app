import 'package:fitness_app/pages/home_page.dart';
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          onSurface: Color.fromARGB(255, 233, 235, 237),
          primary: Color.fromARGB(255, 74, 135, 255),
        ),
      ),
      home: const HomePage(),
    );
  }
}

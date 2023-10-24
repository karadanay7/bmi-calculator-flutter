import 'package:flutter/material.dart';
import 'input_page.dart';
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
        appBarTheme:  const AppBarTheme(
        backgroundColor: Colors.black,

        ),
        primaryColor: const Color(0xFF0A0E21),

        brightness: Brightness.dark,
        scaffoldBackgroundColor:  const Color(0xFF0A0E21),


      ),

      home: const MyHomePage(title: 'BMI CALCULATOR', ),
    );
  }
}


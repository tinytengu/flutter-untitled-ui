import 'package:flutter/material.dart';
import 'package:signup/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Untitled UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple[800],
          secondary: Colors.deepPurple[300],
        ),
      ),
      home: Scaffold(body: HomeScreen()),
    );
  }
}

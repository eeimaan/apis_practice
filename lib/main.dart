
import 'package:apis_practice/ExampleFour.dart';
import 'package:apis_practice/example_Five.dart';
import 'package:apis_practice/example_three.dart';
import 'package:apis_practice/hme_scrn3.dart';
import 'package:apis_practice/home_scrn.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LastExampleScreen(),
    );
  }
}

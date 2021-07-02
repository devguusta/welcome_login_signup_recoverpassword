
import 'package:desafio3/Screens/Welcome/welcome_screen.dart';
import 'package:desafio3/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LevelUp 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
       
      ),
      home: WelcomeScreen(),
    );
  }
}




import 'package:desafio3/Screens/RecoverPassowrd/components/body.dart';
import 'package:flutter/material.dart';

class RecoverPassowrd extends StatefulWidget {
  const RecoverPassowrd({ Key? key }) : super(key: key);

  @override
  _RecoverPassowrdState createState() => _RecoverPassowrdState();
}

class _RecoverPassowrdState extends State<RecoverPassowrd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Body(),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:desafio3/utils/constants.dart';

class ButtonActions extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color;
  final Color textColor;

  const ButtonActions({
    Key? key,
     this.text,
     this.press,
     this.color = kPrimaryColor,
     this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1,),
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            
            primary: textColor,
            backgroundColor: color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          onPressed: () => press,
          child: Text(text!, style: TextStyle(color: textColor,)),
        ),
      ),
    );
  }
}

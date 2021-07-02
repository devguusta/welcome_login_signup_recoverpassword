import 'package:desafio3/Screens/Login/login_screen.dart';
import 'package:desafio3/Screens/SignUp/signup_screen.dart';
import 'package:desafio3/Screens/Welcome/components/background.dart';
import 'package:desafio3/components/button_actions.dart';
import 'package:desafio3/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LEVELUP 03",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 32,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            // ButtonActions(
            //   text: "LOGIN",
            //   press: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
            //   }   ,

            // ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 1,
              ),
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text("LOGIN"),
                ),
              ),  
            ),
            Container(
              padding: EdgeInsetsDirectional.only(bottom: 16),
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    primary:  Colors.black ,
                    backgroundColor: kPrimaryLightColor ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }));
                  },
                  child: Text("Registrar-se"),
                ),
              ),  
            ),      
          ],
        ),
      ),
    );
  }
}

import 'package:desafio3/Screens/Login/login_screen.dart';
import 'package:desafio3/Screens/SignUp/components/background.dart';
import 'package:desafio3/components/input_form.dart';
import 'package:desafio3/utils/constants.dart';
import 'package:desafio3/utils/text_validator.dart';
import 'package:desafio3/utils/visible.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");

  bool passwordVisible = false;    

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
          child: Container(
        child: SafeArea(
            child: Background(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LEVELUP 3 - SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
              InputForm(
        obscureText: false,
        hintText: "Nome Completo",
        icon: Icons.person_outlined,
        keyboardType: TextInputType.text,
        onChanged: (value) {},
        controller: _nameController,
        validator: (value) => Validators().validateName(value!),
              ),
              InputForm(
        obscureText: false,
        hintText: "CPF",
        keyboardType: TextInputType.number,
        icon: Icons.credit_card_outlined,
        onChanged: (value) {},
        controller: _cpfController,
        validator: (value) => Validators().cpfValidator(value!),
              ),
              InputForm(
        obscureText: false,
        hintText: "Email",
        icon: Icons.alternate_email_outlined,
        validator: (value) => Validators().validateEmail(value!),
        onChanged: (value) {},
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
              ),
               InputForm(
        obscureText: passwordVisible,
        hintText: "Senha",
        icon: Icons.lock_outlined,
        onChanged: (value) {},
        controller: _passwordController,
        validator: (value) => Validators().validatePassword(value!),
        keyboardType: TextInputType.visiblePassword,
        suffixIcon: VisibleWidget(
          visible: passwordVisible, 
          onPressed: (){
            setState(() {
              passwordVisible = !passwordVisible;
            });
          })
              ),
                 
              Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            child: Text(
              "Já possui conta ? Entre agora",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
              ),
              SizedBox(
        height: size.height * 0.01,
              ),
              Container(
                width:  size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical : 24.0),
                  child: ElevatedButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
          padding: EdgeInsets.symmetric(
                  horizontal: 40, vertical: 20),
        ),
        onPressed: () {
          if(_formKey.currentState!.validate()){
             ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Salvando dados...'), duration: Duration(seconds: 2),backgroundColor: kPrimaryColor,));
          Future.delayed(Duration(seconds: 2), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        },),);
          });
          } 
        },
        child: Text("Criar conta"),
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
            ),
          ),
      ),
    );
  }
}

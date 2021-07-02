import 'package:desafio3/Screens/RecoverPassowrd/recover_screen.dart';
import 'package:desafio3/Screens/SignUp/signup_screen.dart';
import 'package:desafio3/components/input_form.dart';
import 'package:desafio3/utils/text_validator.dart';
import 'package:desafio3/utils/visible.dart';
import 'package:flutter/material.dart';
import 'package:desafio3/Screens/Login/components/background.dart';
import 'package:desafio3/utils/constants.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LEVELUP 3 - LOGIN",
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
                      hintText: "Entre com seu e-mail",
                      onChanged: (value) {},
                      validator: (value) =>
                          Validators().validateEmailLogin(value!),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.alternate_email_outlined,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    InputForm(
                        obscureText: passwordVisible,
                        hintText: "Senha",
                        icon: Icons.lock_outlined,
                        onChanged: (value) {},
                        controller: _passwordController,
                        validator: (value) =>
                        Validators().validatePasswordLogin(value!),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: VisibleWidget(
                            visible: passwordVisible,
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },),),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return RecoverPassowrd();
                    }));
                          },
                          child: Text(
                            "Recuperar Senha",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                          },
                          child: Text(
                            "Não possui conta ? Registre-se",
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
                      width: size.width * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding:
                                EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Aplicativo em manutenção.Por favor tente novamente mais tarde!'),
                                duration: Duration(seconds: 2),
                                backgroundColor: kPrimaryColor,
                              ));
                              Future.delayed(Duration(seconds: 2), () {});
                            }
                          },
                          child: Text("LOGIN"),
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
    );
  }
}

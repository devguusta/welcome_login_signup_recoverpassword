import 'package:desafio3/Screens/Login/login_screen.dart';
import 'package:desafio3/Screens/RecoverPassowrd/components/background.dart';
import 'package:desafio3/components/input_form.dart';
import 'package:desafio3/utils/constants.dart';
import 'package:desafio3/utils/text_validator.dart';
import 'package:desafio3/utils/visible.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _passwordConfirmController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LEVELUP 3 - RECUPERAR SENHA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputForm(
                    obscureText: false,
                    hintText: "Email cadastrado",
                    onChanged: (value) {},
                    validator: (value) =>
                        Validators().validateEmailLogin(value!),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.alternate_email_outlined,
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
                    obscureText: passwordVisible,
                    hintText: "Senha nova",
                    icon: Icons.lock_outlined,
                    controller: _passwordController,
                    validator: (value) =>
                        Validators().validatePassword(value!),
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: VisibleWidget(
                      visible: passwordVisible,
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                     width: size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical : 8.0),
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
                              content:
                                  Text('Senha atualizada! Aguarde um instante'),
                              duration: Duration(seconds: 2),
                              backgroundColor: kPrimaryColor,
                            ));
                            Future.delayed(Duration(seconds: 2), () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        },),);
                            });
                          }
                        },
                        child: Text("Recuperar Senha"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

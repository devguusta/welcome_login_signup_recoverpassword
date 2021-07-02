import 'package:flutter/material.dart';

import 'package:desafio3/utils/constants.dart';

class InputForm extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  
  const InputForm({
    Key? key,
    required this.hintText,
    required this.icon,
    this.validator,
     this.onChanged,
    this.controller,
    this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
  }) : super(key: key);
// Icons.alternate_email_outlined
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator:  validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          fillColor: kPrimaryLightColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}

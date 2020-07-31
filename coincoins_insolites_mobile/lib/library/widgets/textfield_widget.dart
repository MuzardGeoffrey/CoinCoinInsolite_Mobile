import 'package:flutter/material.dart';

class MyTextField extends TextField{

  bool obscureTextLogin = true;

  MyTextField({
    @required TextEditingController controller,
    TextInputType type: TextInputType.text,
    String hint: "",
    TextStyle hintStyle,
    Icon icon,
    bool autofocus: false,
    bool obscure: false,
    int maxLength,
    GestureDetector suffixIcon,
    onTap,
    textCapitalization,
    bool autocorrect,
  }):super(
    controller: controller,
    autofocus: autofocus,
    keyboardType: type,
    obscureText: obscure,
    maxLength: maxLength,
    textCapitalization: textCapitalization,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: hintStyle,
      icon: icon,
      suffixIcon: suffixIcon,
    ),
    onTap: onTap,
  );
}
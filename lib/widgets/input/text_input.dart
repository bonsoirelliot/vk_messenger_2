import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration decoration;
  final bool obscureText;
  const CustomTextInput({
    this.controller,
    this.decoration = const InputDecoration(),
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration,
      obscureText: obscureText,
    );
  }
}

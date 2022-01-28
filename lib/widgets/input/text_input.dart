import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration decoration;
  const CustomTextInput({
    this.controller,
    this.decoration = const InputDecoration(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration,
    );
  }
}

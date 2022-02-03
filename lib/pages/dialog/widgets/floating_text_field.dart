import 'package:flutter/material.dart';
import 'package:vk_messenger_2/widgets/buttons/material_icon_button.dart';
import 'package:vk_messenger_2/widgets/input/text_input.dart';

class FloatingTextField extends StatelessWidget {
  const FloatingTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -14),
            color: Color(0xFFE6E6E6),
            blurRadius: 10,
          ),
        ],
      ),
      child: CustomTextInput(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              90,
            ),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              90,
            ),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialIconButton(
              backgroundColor: Colors.blueAccent,
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}

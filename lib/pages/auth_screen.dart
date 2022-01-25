import 'package:flutter/material.dart';
import 'package:vk_messenger_2/widgets/other/animated_gradient.dart';
import 'package:vk_messenger_2/theme/styles.dart';
import 'package:vk_messenger_2/widgets/input/text_input.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedGradient(),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'messenger',
                  style: AppStyles.h2,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(),
                SizedBox(
                  height: 4,
                ),
                CustomTextInput(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

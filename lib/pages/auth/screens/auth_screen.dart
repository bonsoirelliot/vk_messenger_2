import 'package:flutter/material.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/pages/auth/wm/login_wm.dart';
import 'package:vk_messenger_2/widgets/other/animated_gradient.dart';
import 'package:vk_messenger_2/theme/styles.dart';
import 'package:vk_messenger_2/widgets/input/text_input.dart';

class LoginScreen extends CoreMwwmWidget<LoginWM> {
  LoginScreen({Key? key})
      : super(
          key: key,
          widgetModelBuilder: (context) => LoginWM(),
        );

  @override
  WidgetState<CoreMwwmWidget<LoginWM>, LoginWM> createWidgetState() =>
      _AuthScreenState();
}

class _AuthScreenState extends WidgetState<LoginScreen, LoginWM> {
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
              children: [
                const Text(
                  'messenger',
                  style: AppStyles.h2,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  controller: wm.loginController,
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomTextInput(
                  controller: wm.passwordController,
                  obscureText: true,
                ),
                TextButton(
                  onPressed: wm.loginAction,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Log In',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

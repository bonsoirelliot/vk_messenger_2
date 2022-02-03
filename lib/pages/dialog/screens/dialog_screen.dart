import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/dialog/screens/dialog_screen_content.dart';
import 'package:vk_messenger_2/pages/dialog/widgets/floating_text_field.dart';
import 'package:vk_messenger_2/theme/styles.dart';
import 'package:vk_messenger_2/widgets/app_bar/background_app_bar.dart';
import 'package:vk_messenger_2/widgets/global/screen_cover.dart';

class DialogScreen extends StatelessWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenCover(
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BackgroundAppBar(
                leading: Row(
                  children: const [
                    CircleAvatar(
                      child: Text(
                        'D',
                        style: AppStyles.h3,
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Name LastName',
                      style: AppStyles.h2,
                    ),
                  ],
                ),
              ),
              const DialogScreenContent(),
            ],
          ),
        ),
        floatingActionButton: const FloatingTextField(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

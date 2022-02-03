import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/chats/screens/chats_screen_content.dart';
import 'package:vk_messenger_2/pages/chats/widgets/chat_widget.dart';
import 'package:vk_messenger_2/test/models.dart';
import 'package:vk_messenger_2/theme/styles.dart';
import 'package:vk_messenger_2/widgets/app_bar/background_app_bar.dart';
import 'package:vk_messenger_2/widgets/liner.dart';
import 'package:vk_messenger_2/widgets/global/screen_cover.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScreenCover(
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const BackgroundAppBar(
                leading: Text(
                  'Messenger',
                  style: AppStyles.h2,
                ),
              ),
              SafeArea(
                child: DraggableScrollableSheet(
                  snap: true,
                  builder: (context, controller) {
                    return ChatsScreenContent(
                      controller: controller,
                    );
                  },
                  maxChildSize: 1,
                  minChildSize: 0.9,
                  initialChildSize: 0.9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

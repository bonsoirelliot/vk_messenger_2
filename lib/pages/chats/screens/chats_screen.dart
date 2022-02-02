import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/chats/screens/chats_screen_content.dart';
import 'package:vk_messenger_2/pages/chats/widgets/chat_widget.dart';
import 'package:vk_messenger_2/test/models.dart';
import 'package:vk_messenger_2/widgets/liner.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            SafeArea(
              child: Container(
                height: 150,
                color: Colors.blueAccent,
              ),
            ),
            SafeArea(
              child: DraggableScrollableSheet(
                builder: (context, controller) {
                  return ChatsScreenContent(
                    controller: controller,
                  );
                },
                maxChildSize: 1,
                minChildSize: 0.8,
                initialChildSize: 0.8,
              ),
            )
          ],
        ),
      ),
    );
  }
}

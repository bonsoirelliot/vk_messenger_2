import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/chats/widgets/chat_widget.dart';
import 'package:vk_messenger_2/test/models.dart';
import 'package:vk_messenger_2/widgets/liner.dart';

class ChatsScreenContent extends StatelessWidget {
  final ScrollController controller;
  const ChatsScreenContent({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            20,
          ),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      child: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Column(
                    children: [
                      ChatWidget(chatModel: Models.chats[i]),
                      if (i != Models.chats.length - 1) const Liner(),
                    ],
                  );
                },
                childCount: Models.chats.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

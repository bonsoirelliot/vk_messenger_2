import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/dialog/widgets/message_bubble.dart';
import 'package:vk_messenger_2/test/models.dart';
import 'package:vk_messenger_2/widgets/scrollable/top_sheet_container.dart';

class DialogScreenContent extends StatelessWidget {
  final ScrollController controller;
  const DialogScreenContent({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const TopSheetContainer(),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              return Container(
                color: Colors.white,
                //constraints: BoxConstraints.expand(),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: MessageBubble(
                    message: Models.messages[i],
                  ),
                ),
              );
            },
            childCount: Models.messages.length,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

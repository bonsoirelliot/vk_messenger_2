import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/dialog/widgets/message_bubble.dart';
import 'package:vk_messenger_2/static/static_data.dart';
import 'package:vk_messenger_2/test/models.dart';

class DialogScreenContent extends StatelessWidget {
  const DialogScreenContent({
    Key? key,
  }) : super(key: key);

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
      height: MediaQuery.of(context).size.height * 0.9,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: StaticData.standartPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  // return Padding(
                  //   padding: EdgeInsets.only(
                  //       bottom: 4,
                  //       top: i == 0 ? StaticData.standartPadding : 0),
                  //   child: MessageBubble(
                  //     message: Models.messages[i],
                  //   ),
                  // );
                  return SizedBox();
                },
                childCount: 2,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

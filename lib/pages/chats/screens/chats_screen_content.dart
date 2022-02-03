import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/models/chat/conversation_item.dart';
import 'package:vk_messenger_2/pages/chats/screens/chats_screen.dart';
import 'package:vk_messenger_2/pages/chats/widgets/chat_widget.dart';
import 'package:vk_messenger_2/pages/chats/wm/chats_screen_wm.dart';
import 'package:vk_messenger_2/test/models.dart';
import 'package:vk_messenger_2/widgets/liner.dart';

class ChatsScreenContent extends StatefulWidget {
  const ChatsScreenContent({Key? key}) : super(key: key);

  @override
  State<ChatsScreenContent> createState() => _ChatsScreenContentState();
}

class _ChatsScreenContentState extends State<ChatsScreenContent> {
  late final ChatsScreenWM wm;

  @override
  void initState() {
    super.initState();

    wm = Provider.of<ChatsScreenWM>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
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
        physics: const BouncingScrollPhysics(),
        slivers: [
          EntityStateBuilder<List<ConversationItem>>(
              streamedState: wm.chats,
              loadingChild: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    CircularProgressIndicator.adaptive(),
                  ],
                ),
              ),
              builder: (context, state) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Column(
                        children: [
                          ChatWidget(
                            conversationItem: state[i],
                            onTap: () {
                              Navigator.of(context).pushNamed('/dialog');
                            },
                          ),
                          if (i != state.length - 1) const Liner(),
                        ],
                      );
                    },
                    childCount: state.length,
                  ),
                );
              }),
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

import 'package:flutter/material.dart';
import 'package:vk_messenger_2/models/chat/chat_model.dart';
import 'package:vk_messenger_2/models/chat/conversation_item.dart';
import 'package:vk_messenger_2/theme/styles.dart';

class ChatWidget extends StatelessWidget {
  final ConversationItem conversationItem;
  final VoidCallback? onTap;
  final double topPadding;
  const ChatWidget({
    required this.conversationItem,
    this.topPadding = 8.0,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        20,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, topPadding, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  const CircleAvatar(
                    child: Text(
                      'A',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          conversationItem.conversationModel.peerModel.id
                              .toString(),
                          style: AppStyles.h3.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          conversationItem.lastMessage.text,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '${DateTime.fromMillisecondsSinceEpoch(conversationItem.lastMessage.date * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(conversationItem.lastMessage.date * 1000).minute}',
                  style: AppStyles.p2.copyWith(color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CircleAvatar(
                  radius: 8,
                  child: Text(
                    '2',
                    style: AppStyles.p2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

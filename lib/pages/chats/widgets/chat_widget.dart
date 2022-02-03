import 'package:flutter/material.dart';
import 'package:vk_messenger_2/models/chat/chat_model.dart';
import 'package:vk_messenger_2/theme/styles.dart';

class ChatWidget extends StatelessWidget {
  final ChatModel chatModel;
  final VoidCallback? onTap;
  final double topPadding;
  const ChatWidget({
    required this.chatModel,
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
                  CircleAvatar(
                    child: Text(
                      chatModel.name.characters.first.toUpperCase(),
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
                          chatModel.name,
                          style: AppStyles.h3.copyWith(
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          chatModel.lastMessage,
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
                  chatModel.time,
                  style: AppStyles.p2.copyWith(color: Colors.blueGrey),
                ),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 8,
                  child: Text(
                    chatModel.unreadCount.toString(),
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

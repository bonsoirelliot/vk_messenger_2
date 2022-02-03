import 'package:flutter/material.dart';
import 'package:vk_messenger_2/models/chat/message_model.dart';
import 'package:vk_messenger_2/static/static_data.dart';
import 'package:vk_messenger_2/theme/styles.dart';

class MessageBubble extends StatelessWidget {
  final MessageModel message;
  const MessageBubble({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.main ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(
              StaticData.standartPadding,
            ),
            decoration: BoxDecoration(
              color: message.main ? Colors.blueAccent : Colors.blueGrey[100],
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(
                  20,
                ),
                topRight: const Radius.circular(
                  20,
                ),
                bottomLeft: message.main
                    ? const Radius.circular(
                        20,
                      )
                    : const Radius.circular(
                        5,
                      ),
                bottomRight: message.main
                    ? const Radius.circular(
                        5,
                      )
                    : const Radius.circular(
                        20,
                      ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message.text,
                  style: AppStyles.p1.copyWith(
                    color: message.main ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  message.date.toString(),
                  style: AppStyles.p2.copyWith(
                    color: message.main ? Colors.white60 : Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

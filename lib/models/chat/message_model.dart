import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';

class MessageModel {
  // final String message;
  // final String time;
  final bool main;

  final int date;
  final int fromId;
  final int id;
  final int out;
  final int conversationMessageId;
  final bool isImportant;
  final bool isHidden;
  final int peerId;
  final String text;

  MessageModel({
    // required this.message,
    // required this.time,
    this.main = true,
    required this.date,
    required this.fromId,
    required this.id,
    required this.out,
    required this.conversationMessageId,
    required this.isHidden,
    required this.isImportant,
    required this.peerId,
    required this.text,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    try {
      return MessageModel(
        date: map['date'] as int,
        fromId: map['from_id'] as int,
        id: map['id'] as int,
        out: map['out'] as int,
        conversationMessageId: map['conversation_message_id'] as int,
        isHidden: map['is_hidden'] as bool,
        isImportant: map['important'] as bool,
        peerId: map['peer_id'] as int,
        text: map['text'] as String,
      );
    } catch (e) {
      throw ResponseParseException('MessageModel: $e');
    }
  }
}

import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/chat/conversation_model.dart';
import 'package:vk_messenger_2/models/chat/message_model.dart';

class ConversationItem {
  final ConversationModel conversationModel;
  final MessageModel lastMessage;

  ConversationItem({
    required this.conversationModel,
    required this.lastMessage,
  });

  factory ConversationItem.fromMap(Map<String, dynamic> map) {
    try {
      return ConversationItem(
        conversationModel: ConversationModel.fromMap(
          map['conversation'] as Map<String, dynamic>,
        ),
        lastMessage: MessageModel.fromMap(
          map['last_message'] as Map<String, dynamic>,
        ),
      );
    } catch (e) {
      throw ResponseParseException('ConversationItem: $e');
    }
  }
}

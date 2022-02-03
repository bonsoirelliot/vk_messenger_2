import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/chat/conversation_item.dart';
import 'package:vk_messenger_2/models/chat/conversation_model.dart';

class ConversationsResponse {
  final int count;
  final List<ConversationItem> items;

  ConversationsResponse({
    required this.count,
    required this.items,
  });

  factory ConversationsResponse.fromMap(Map<String, dynamic> map) {
    try {
      return ConversationsResponse(
        count: map['count'] as int,
        items: (map['items'] as List<dynamic>)
            .map((dynamic item) =>
                ConversationItem.fromMap(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      throw ResponseParseException('ConversationsResponse: $e');
    }
  }
}

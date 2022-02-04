import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/chat/conversation_item.dart';
import 'package:vk_messenger_2/models/chat/conversation_model.dart';
import 'package:vk_messenger_2/models/chat/chat_settings/profile_model.dart';

class ConversationsResponse {
  final int count;
  final List<ConversationItem> items;
  final List<ProfileModel> profiles;

  ConversationsResponse({
    required this.count,
    required this.items,
    required this.profiles,
  });

  factory ConversationsResponse.fromMap(Map<String, dynamic> map) {
    try {
      return ConversationsResponse(
          count: map['count'] as int,
          items: (map['items'] as List<dynamic>)
              .map(
                (dynamic item) =>
                    ConversationItem.fromMap(item as Map<String, dynamic>),
              )
              .toList(),
          profiles: (map['profiles'] as List<dynamic>)
              .map(
                (dynamic profile) =>
                    ProfileModel.fromMap(profile as Map<String, dynamic>),
              )
              .toList());
    } catch (e) {
      throw ResponseParseException('ConversationsResponse: $e');
    }
  }
}

import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/chat/chat_settings/base_settings_model.dart';

class ChatSettingsModel extends BaseSettingsModel {
  // final String title;
  // final String photo;

  ChatSettingsModel({
    required String title,
    required String photo,
  }) : super(name: title, img: photo);

  factory ChatSettingsModel.fromMap(Map<String, dynamic> map) {
    try {
      return ChatSettingsModel(
        title: map['title'] as String,
        photo: (map['photo'] as Map<String, dynamic>)['photo_50'] as String,
      );
    } catch (e) {
      throw ResponseParseException('ChatSettingsModel: $e');
    }
  }
}

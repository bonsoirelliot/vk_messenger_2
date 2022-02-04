import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/models/chat/chat_settings/base_settings_model.dart';

class ProfileModel extends BaseSettingsModel {
  final int id;
  //final String name;
  final String lastName;
  final String screenName;

  //final String img;

  ProfileModel({
    required this.id,
    required String name,
    required this.lastName,
    required this.screenName,
    required String img,
  }) : super(name: name, img: img);

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    try {
      return ProfileModel(
        id: map['id'] as int,
        name: map['first_name'] as String,
        lastName: map['last_name'] as String,
        screenName: map['screen_name'] as String,
        img: map['photo_50'] as String,
      );
    } catch (e) {
      throw ResponseParseException('ProfileModel: $e');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:vk_messenger_2/models/base/base_response.dart';
import 'package:vk_messenger_2/models/chat/conversations_response.dart';
import 'package:vk_messenger_2/services/request_handler/request_handler.dart';

class ChatsDownloader {
  static Future<ConversationsResponse> download() async {
    final rh = RequestHandler();

    final resp = (await rh.get(
      'messages.getConversations',
      queryParameters: <String, dynamic>{
        'count': 20,
        'filter': 'all',
        'extended': 1,
        //'fields': '[first_name,last_name]',
      },
    ))
        .data as Map<String, dynamic>;

    //debugPrint(resp['response'].toString());

    final data = BaseResponseRepository.fromMap(resp);

    return ConversationsResponse.fromMap(data.response as Map<String, dynamic>);
  }
}

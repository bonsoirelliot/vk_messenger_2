import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/exceptions/custom_exception.dart';
import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/exceptions/success_false.dart';
import 'package:vk_messenger_2/models/chat/conversation_item.dart';
import 'package:vk_messenger_2/models/chat/conversations_response.dart';
import 'package:vk_messenger_2/pages/chats/downloader/chats_downloader.dart';
import 'package:vk_messenger_2/services/request_handler/request_handler.dart';

class ChatsScreenWM extends WidgetModel {
  final chats = EntityStreamedState<List<ConversationItem>>();

  ChatsScreenWM() : super(const WidgetModelDependencies());

  @override
  void onLoad() {
    _loadChats();
    super.onLoad();
  }

  Future<void> _loadChats() async {
    final rh = RequestHandler();

    CustomException? error;

    late ConversationsResponse result;

    try {
      chats.loading([]);
      result = await ChatsDownloader.download();

      chats.content(result.items);
    } on ResponseParseException catch (e) {
      error = CustomException(
        title: e.toString(),
      );
    } on DioError catch (e) {
      error = CustomException(
        title: e.toString(),
      );
    } on SuccessFalse catch (e) {
      error = CustomException(
        title: e.toString(),
      );
    }

    if (error != null) {
      debugPrint(error.title);
    }
  }
}

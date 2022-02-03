import 'package:vk_messenger_2/models/chat/chat_model.dart';
import 'package:vk_messenger_2/models/chat/message_model.dart';

class Models {
  static List<ChatModel> chats = [
    ChatModel(
      name: 'Anatoly',
      lastMessage: 'blablablab',
      unreadCount: 2,
      time: '10:31',
    ),
    ChatModel(
      name: 'Anatoly',
      lastMessage:
          'blablablabblablablabblablablabblablablabblablablabblablablabblablablabblablablabblablablabblablablab',
      unreadCount: 2,
      time: '10:31',
    ),
    ChatModel(
      name: 'Anatoly',
      lastMessage: 'blablablab',
      unreadCount: 2,
      time: '10:31',
    ),
    ChatModel(
      name: 'Anatoly',
      lastMessage: 'blablablab',
      unreadCount: 2,
      time: '10:31',
    ),
    ChatModel(
      name: 'Anatoly',
      lastMessage: 'blablablab',
      unreadCount: 2,
      time: '10:31',
    ),
  ];

  static List<MessageModel> messages = [
    MessageModel(message: 'message', time: '10:20', main: false),
    MessageModel(message: 'asdsads', time: '10:20'),
    MessageModel(message: 'sdssdsdsd', time: '10:20', main: false),
    MessageModel(message: 'message', time: '10:20', main: false),
    MessageModel(message: 'message', time: '10:20'),
  ];
}

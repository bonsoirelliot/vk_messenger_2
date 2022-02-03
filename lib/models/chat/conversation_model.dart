import 'package:vk_messenger_2/models/chat/message_model.dart';
import 'package:vk_messenger_2/models/chat/peer_model.dart';

class ConversationModel {
  final PeerModel peerModel;
  //final MessageModel lastMessage;

  ConversationModel({
    required this.peerModel,
    //required this.lastMessage,
  });

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      peerModel: PeerModel.fromMap(
        map['peer'] as Map<String, dynamic>,
      ),
      // lastMessage: MessageModel.fromMap(
      //   map['last_message'] as Map<String, dynamic>,
      // ),
    );
  }
}

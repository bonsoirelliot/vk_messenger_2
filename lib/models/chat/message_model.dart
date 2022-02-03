class MessageModel {
  final String message;
  final String time;
  final bool main;

  MessageModel({
    required this.message,
    required this.time,
    this.main = true,
  });
}

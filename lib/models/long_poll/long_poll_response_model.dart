import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';

class LongPollResponse {
  final int ts;

  LongPollResponse({required this.ts});

  factory LongPollResponse.fromMap(Map<String, dynamic> map) {
    try {
      return LongPollResponse(ts: map['ts'] as int);
    } catch (e) {
      throw ResponseParseException(e.toString());
    }
  }
}

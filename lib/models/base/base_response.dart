import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/exceptions/success_false.dart';

class BaseResponseRepository {
  /// данные в ответе на запрос
  final dynamic response;

  BaseResponseRepository({
    required this.response,
  });

  factory BaseResponseRepository.fromMap(Map<String, dynamic> map) {
    if (map.containsKey(['error'])) {
      throw SuccessFalse(map['error_description'] ?? 'Сервер вернул ошибку');
    }

    try {
      return BaseResponseRepository(
        response: map['response'],
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw ResponseParseException(e.toString());
    }
  }
}

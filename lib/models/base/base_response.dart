import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/exceptions/success_false.dart';

class BaseResponseRepository {
  /// данные в ответе на запрос
  final dynamic data;

  /// результат выполнения запроса
  final bool success;

  /// некое сообщение
  /// обычно присутствует если [success] == false
  final String? message;

  final int? code;

  BaseResponseRepository({
    required this.data,
    required this.success,
    this.code,
    this.message,
  });

  factory BaseResponseRepository.fromMap(Map<String, dynamic> map) {
    if (map['success'] is! bool) {
      throw ResponseParseException('Ответ от сервера не содержит success');
    }

    if (map['success'] == false) {
      throw SuccessFalse(map['message'] as String? ?? 'Произошла ошибка');
    }

    try {
      return BaseResponseRepository(
        data: map['data'],
        success: map['success'] as bool,
        code: map['code'] as int?,
        message: map['message'] as String?,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      throw ResponseParseException(e.toString());
    }
  }
}

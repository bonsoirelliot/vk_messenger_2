import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';

class AuthResponse {
  final String token;
  final int expiresIn;
  final int userId;

  AuthResponse({
    required this.token,
    required this.expiresIn,
    required this.userId,
  });

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    try {
      return AuthResponse(
        token: map['access_token'] as String,
        expiresIn: map['expires_in'] as int,
        userId: map['user_id'] as int,
      );
    } catch (e) {
      throw ResponseParseException(e.toString());
    }
  }
}

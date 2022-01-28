import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/exceptions/custom_exception.dart';
import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/exceptions/success_false.dart';
import 'package:vk_messenger_2/models/auth/auth_response.dart';
import 'package:vk_messenger_2/models/base/base_response.dart';
import 'package:vk_messenger_2/services/request_handler/request_handler.dart';
import 'package:vk_messenger_2/static/static_data.dart';

class AuthWM extends WidgetModel {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final authState = StreamedState<bool>(false);

  final loginAction = VoidAction();

  AuthWM() : super(const WidgetModelDependencies());

  @override
  void onBind() {
    loginAction.bind((p0) {
      _auth(loginController.text, passwordController.text);
    });

    super.onBind();
  }

  Future<void> _auth(String login, String password) async {
    final rh = RequestHandler(baseUrl: StaticData.authUrl);

    CustomException? error;

    String _token = 'null';

    try {
      var response = AuthResponse.fromMap(
        (await rh.post(
          '',
          queryParameters: <String, dynamic>{
            'grant_type': 'password',
            'client_id': StaticData.clientId,
            'client_secret': StaticData.clientSecret,
            'username': login,
            'password': password,
            'scope': 'messages',
            'test_redirect_uri ': 0,
            'v': 5.131,
            '2fa_supported ': 0,
          },
        ))
            .data as Map<String, dynamic>,
      );

      _token = response.token;
    } on ResponseParseException {
      error = CustomException(
        title: 'AuthWM : responseParse',
      );
    } on DioError {
      error = CustomException(
        title: 'AuthWM : dio',
      );
    } on SuccessFalse {
      error = CustomException(
        title: 'AuthWM : success false',
      );
    }

    if (error != null) {
      debugPrint(error.title);
    } else {
      debugPrint('token: $_token');
    }
  }
}

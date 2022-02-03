import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/exceptions/custom_exception.dart';
import 'package:vk_messenger_2/exceptions/response_parse_exception.dart';
import 'package:vk_messenger_2/exceptions/success_false.dart';
import 'package:vk_messenger_2/models/auth/auth_response.dart';
import 'package:vk_messenger_2/services/request_handler/request_handler.dart';
import 'package:vk_messenger_2/static/static_data.dart';

class LoginWM extends WidgetModel {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  final authState = StreamedState<bool>(false);

  final loginAction = VoidAction();

  LoginWM() : super(const WidgetModelDependencies());

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

    String? _token;

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
    } else {
      debugPrint('token: $_token');

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('user_token', _token!);

      Keys.mainNav.currentState!.pushNamed('/chats');
    }
  }
}

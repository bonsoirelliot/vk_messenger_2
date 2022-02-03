import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/static/static_data.dart';

class AuthWM extends WidgetModel {
  late final String? token;
  AuthWM() : super(const WidgetModelDependencies());

  @override
  Future<void> onLoad() async {
    token = await _checkToken();

    if (token != null) {
      Keys.mainNav.currentState!.pushNamedAndRemoveUntil(
        '/chats',
        (route) => route.isCurrent,
      );
    } else {
      Keys.mainNav.currentState!.pushNamedAndRemoveUntil(
        '/login',
        (route) => route.isCurrent,
      );
    }
    super.onLoad();
  }

  Future<String?> _checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('user_token')) {
      return prefs.getString('user_token');
    }
  }
}

import 'package:flutter/material.dart';

class StaticData {
  static String baseUrl = 'https://api.vk.com/method/';

  static String authUrl = 'https://oauth.vk.com/token/';

  static String clientId = '3140623';
  static String clientSecret = 'VeWdmVclDCtn6ihuP1nt';

  static int longPollWait = 25;

  static double standartPadding = 12.0;

  static String longPollUrl({
    required String server,
    required String key,
    required int ts,
  }) {
    return 'https://{$server}?act=a_check&key={$key}&ts={$ts}&wait=$longPollWait&mode=2&version=3';
  }
}

class Keys {
  static GlobalKey<NavigatorState> mainNav = GlobalKey();
}

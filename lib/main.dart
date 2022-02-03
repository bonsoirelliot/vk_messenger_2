import 'package:flutter/material.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/navigation/main_navigator.dart';
import 'package:vk_messenger_2/pages/auth/wm/auth_wm.dart';
import 'package:vk_messenger_2/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends CoreMwwmWidget<AuthWM> {
  MyApp({Key? key})
      : super(
            key: key,
            widgetModelBuilder: (context) {
              return AuthWM();
            });

  @override
  WidgetState<CoreMwwmWidget<AuthWM>, AuthWM> createWidgetState() =>
      _MyAppState();
}

class _MyAppState extends WidgetState<MyApp, AuthWM> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.currentAppTheme,
      home: const MainNavigator(),
    );
  }
}

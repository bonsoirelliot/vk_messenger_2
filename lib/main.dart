import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/auth_screen.dart';
import 'package:vk_messenger_2/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.currentAppTheme,
      home: const AuthScreen(),
    );
  }
}

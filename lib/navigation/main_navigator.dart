import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_messenger_2/pages/auth/screens/auth_screen.dart';
import 'package:vk_messenger_2/pages/chats/screens/chats_screen.dart';
import 'package:vk_messenger_2/pages/dialog/screens/dialog_screen.dart';
import 'package:vk_messenger_2/pages/loading/loading_screen.dart';
import 'package:vk_messenger_2/static/static_data.dart';

class MainNavigator extends StatelessWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Keys.mainNav,
      requestFocus: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        var showAnimation = true;

        switch (settings.name) {
          case '/':
            page = const LoadingScreen();
            //showAnimation = false;
            break;

          case '/login':
            page = LoginScreen();
            //showAnimation = false;
            break;

          case '/chats':
            page = ChatsScreen();
            //showAnimation = false;
            break;

          case '/dialog':
            page = const DialogScreen();
            //showAnimation = false;
            break;

          default:
            page = const LoadingScreen();
            //showAnimation = false;
            break;
        }

        if (showAnimation) {
          if (Platform.isIOS) {
            return CupertinoPageRoute<void>(builder: (context) {
              return page;
            });
          } else {
            return MaterialPageRoute<void>(builder: (context) {
              return page;
            });
          }
        }
        // else {
        //   return PageRouteBuilder<void>(
        //     pageBuilder: (context, animation, secondaryAnimation) {
        //       return page;
        //     },
        //   );
        // }
      },
    );
  }
}

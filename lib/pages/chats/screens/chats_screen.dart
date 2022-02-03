import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_mwwm/surf_mwwm.dart';
import 'package:vk_messenger_2/pages/chats/screens/chats_screen_content.dart';
import 'package:vk_messenger_2/pages/chats/wm/chats_screen_wm.dart';
import 'package:vk_messenger_2/theme/styles.dart';
import 'package:vk_messenger_2/widgets/app_bar/background_app_bar.dart';
import 'package:vk_messenger_2/widgets/global/screen_cover.dart';

class ChatsScreen extends CoreMwwmWidget<ChatsScreenWM> {
  ChatsScreen({Key? key})
      : super(key: key, widgetModelBuilder: (context) => ChatsScreenWM());

  @override
  WidgetState<CoreMwwmWidget<ChatsScreenWM>, ChatsScreenWM>
      createWidgetState() => _ChatsScreenState();
}

class _ChatsScreenState extends WidgetState<ChatsScreen, ChatsScreenWM> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return ScreenCover(
      child: Scaffold(
        body: SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const BackgroundAppBar(
                leading: Text(
                  'Messenger',
                  style: AppStyles.h2,
                ),
              ),
              Provider(
                create: (context) {
                  return wm;
                },
                child: const ChatsScreenContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

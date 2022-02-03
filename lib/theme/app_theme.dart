import 'package:flutter/material.dart';
import 'package:vk_messenger_2/static/static_data.dart';

class AppTheme {
  static ThemeData get currentAppTheme => ThemeData(
        fontFamily: 'Euclid Circular A',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.blueGrey,
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.fromLTRB(
              StaticData.standartPadding, 0, StaticData.standartPadding, 0),
          //isDense: true,
          fillColor: Colors.blueGrey[100],
          filled: true,
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                90,
              ),
              borderSide: BorderSide.none),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        // scaffoldBackgroundColor: mystic,
        // primarySwatch: turquoiseBlueMaterial,
        // appBarTheme: const AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarColor: mystic,
        //     statusBarIconBrightness: Brightness.dark,
        //   ),
        // ),
      );
}

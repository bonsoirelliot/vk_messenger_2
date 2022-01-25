import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get currentAppTheme => ThemeData(
        fontFamily: 'Euclid Circular A',
        // textSelectionTheme: const TextSelectionThemeData(
        //   cursorColor: turquoiseBlue,
        //   selectionColor: turquoiseBlue,
        //   selectionHandleColor: turquoiseBlue,
        // ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          isDense: true,
          border: InputBorder.none,
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

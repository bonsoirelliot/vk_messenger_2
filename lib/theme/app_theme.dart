import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get currentAppTheme => ThemeData(
        fontFamily: 'Euclid Circular A',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.red,
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          //isDense: true,
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.red,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
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

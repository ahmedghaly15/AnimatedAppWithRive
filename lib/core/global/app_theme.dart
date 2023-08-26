import 'package:animated_app/core/global/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData appTheme() => ThemeData(
      scaffoldBackgroundColor: const Color(0xFFEEF1F8),
      primarySwatch: AppColors.primaryColor,
      fontFamily: "Intel",
      // textTheme: ThemeData.light().textTheme,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(height: 0),
        border: defaultInputBorder,
        enabledBorder: defaultInputBorder,
        focusedBorder: defaultInputBorder,
        errorBorder: defaultInputBorder,
      ));

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFDEE3F2),
      width: 1,
    ),
  );
}

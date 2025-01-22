import 'package:player_pedia/util/theme/app_app_bar_theme.dart';
import 'package:player_pedia/util/theme/app_check_box_theme.dart';
import 'package:player_pedia/util/theme/app_elevated_button_theme.dart';
import 'package:player_pedia/util/theme/app_text_form_field_theme.dart';
import 'package:flutter/material.dart';

class AppTheme{



  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.pink,
    scaffoldBackgroundColor: Colors.white,
    // textTheme:AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButton.lightElevatedButtonTheme,
    appBarTheme:AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckboxTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme
  );



  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      // textTheme:AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButton.darkElevatedButtonTheme,
      appBarTheme:AppAppBarTheme.darkAppBarTheme,
      checkboxTheme: AppCheckBoxTheme.darkCheckboxTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme


  );



}
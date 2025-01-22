import 'package:flutter/material.dart';

class AppTextFormFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    errorStyle: const TextStyle(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.black12,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey.shade400,
    suffixIconColor: Colors.grey.shade400,
    labelStyle: const TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    hintStyle: const TextStyle(
      fontSize: 14,
      color: Colors.white70,
    ),
    errorStyle: const TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.redAccent,
    ),
    floatingLabelStyle: TextStyle(
      color: Colors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.white54,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.redAccent,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      borderSide: BorderSide(
        width: 2,
        color: Colors.orange,
      ),
    ),
  );
}

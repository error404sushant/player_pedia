import 'package:flutter/material.dart';

extension CustomTextTheme on TextTheme {
  //region App Display
  TextStyle appDisplayLarge(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appDisplayMedium(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appDisplaySmall(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black).copyWith(height: 0);
  }
  //endregion

  //region App Headline
  TextStyle appHeadlineLarge(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appHeadlineMedium(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appHeadlineSmall(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black).copyWith(height: 0);
  }
  //endregion

  //region App Title
  TextStyle appTitleLarge(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appTitleMedium(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appTitleSmall(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black).copyWith(height: 0);
  }
  //endregion

  //region App Body
  TextStyle appBodyLarge(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appBodyMedium(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black).copyWith(height: 0);
  }

  TextStyle appBodySmall(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white).copyWith(height: 0)
        : const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black).copyWith(height: 0);
  }
//endregion
}
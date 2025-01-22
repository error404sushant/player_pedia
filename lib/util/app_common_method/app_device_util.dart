import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppDeviceUtil {
  //region Close keyboard
  static closeKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
  //endregion

  //region Is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
  //endregion

  //region Default space
  static double  defaultSpace() {
    return 10;
  }
  //endregion

  //region Screen height
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  //endregion

  //region Screen width
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
  //endregion

  //region App bar height
  static double appBarHeight(BuildContext context) {
    return kToolbarHeight;
  }
  //endregion

  //region Bottom navigation height
  static double bottomNavigationHeight(BuildContext context) {
    return kBottomNavigationBarHeight;
  }
  //endregion

  //region Launch url
  static Future<void> launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  //endregion

  //region Vibrate
  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }
  //endregion

  //region Is keyboard visible
  static bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
//endregion
}

// theme_provider.dart

import 'package:flutter/material.dart';
import 'package:player_pedia/services/storage_service/storage_service.dart';
import 'package:player_pedia/services/storage_service/storage_service_box.dart';
import 'package:player_pedia/services/storage_service/storage_service_key.dart';

class AppThemeProvider extends ChangeNotifier {
  // Store the current theme mode
  ThemeMode themeMode = ThemeMode.system;


  


  //region Check app theme
  void checkAppTheme(){
    // HiveManager().openBox(StorageServiceBox.appThemeInfo);
    // Object isDarkMode = HiveManager().getData(StorageServiceBox.appThemeInfo, StorageServiceBoxAndKey.isDarkMode);
    //
    // print(isDarkMode);



  }
  //endregion



  //region Toggle the theme mode between light, dark, and system
  void toggleTheme({required BuildContext context}) {
    // Get the current theme mode
    final currentThemeMode = Theme.of(context).brightness;
    //Update the theme
    if(currentThemeMode == Brightness.light){
      themeMode = ThemeMode.dark;
    }
    else{
      themeMode = ThemeMode.light;
    }
    //Save info in db
    //Update ui
    notifyListeners(); // Notify listeners (widgets) to rebuild
  }
  //endregion





}

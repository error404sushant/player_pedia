
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:player_pedia/features/app.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/storage_service/storage_service_box.dart';
// import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Platform check for non-web platforms
  if (!kIsWeb) {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path); // Initialize Hive with the documents directory
    //Register adapter
    //Player detail adapter
     Hive.registerAdapter(PlayerDetailAdapter());
     //Total periodic score adapter
     Hive.registerAdapter(TotalPeriodicScoreAdapter());
     //Open box (Create table)
    await Hive.openBox(StorageServiceBox.playerInfo);
  } else {
    Hive.init('web_hive'); // Use a fallback for web
  }



  runApp(
      kIsWeb
      ? const App():
      // : DevicePreview(
      //     enabled: !kReleaseMode,
      //     builder: (context) => const App(), // Wrap your app
      //   )
      const App()
  );






}

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:player_pedia/app_providers/admin_provider.dart';
import 'package:player_pedia/app_providers/app_theme_provider.dart';
import 'package:player_pedia/app_providers/player_detail_provider.dart';
import 'package:player_pedia/app_providers/player_search_provider.dart';
import 'package:player_pedia/features/common_widgets/error_widgets/error_card.dart';
import 'package:player_pedia/features/screens/splash/splash_screen.dart';
import 'package:player_pedia/features/screens/theme_select/theme_select_screen.dart';
import 'package:player_pedia/util/app_constants/app_constants.dart';
import 'package:player_pedia/util/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  //region Init
  @override
  void initState() {
    countAllHiveBoxes();
    super.initState();
  }
  //endregion



  void countAllHiveBoxes() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String hivePath = '${appDocDir.path}';
    Directory hiveDir = Directory(hivePath);

    if (await hiveDir.exists()) {
      List<FileSystemEntity> boxes = await hiveDir.list().toList();
      print("Total bos are ${boxes.length}");
    } else {
      print("No table are there");
    }
  }

  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlayerSearchProvider()),
        ChangeNotifierProvider(create: (context) => PlayerDetailProvider()),
        ChangeNotifierProvider(create: (context) => AdminProvider()),


        ChangeNotifierProxyProvider<PlayerSearchProvider, AdminProvider>(
          create: (context) => AdminProvider(),
          update: (context, playerSearchProvider, adminProvider) {
            // You can now access PlayerSearchProvider within AdminProvider
            adminProvider?.updatePlayerSearchProvider(playerSearchProvider);
            return adminProvider!;
          },
        ),

      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Consumer<AppThemeProvider>(
          builder: (BuildContext context, AppThemeProvider appThemeProvider, Widget? child) {
            return MaterialApp(
              themeMode: appThemeProvider.themeMode,
              darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              // scrollBehavior: MyCustomScrollBehavior(),
              builder: (context,child){
                ScreenUtil.init(context);
                ErrorWidget.builder = (errorDetails) {
                  return const ErrorCard();
                };
                return child!;
              },

              home: SplashScreen(),
            );
          },

        ),
      ),
    );
    //endregion

  }
}

//region Over scroll blue color remove
class MyCustomScrollBehavior extends MaterialScrollBehavior {

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
//endregion
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_pedia/features/screens/player_detail/player_detail_screen.dart';
import 'dart:async';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/fetch_player_detail_services/fetch_player_detail_service.dart';
import 'package:player_pedia/util/app_enums.dart';

class PlayerDetailProvider with ChangeNotifier {
  //region Common Variables
  String selectedPeriod = 'Day'; // Default selected period
  final List<String> periodOptions = ['Day', 'Yearly'];

  //endregion

  //region On change of period
  void onChangePeriod({required int index}) {
    selectedPeriod = periodOptions[index];
    notifyListeners();
  }
//endregion
}

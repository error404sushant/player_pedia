import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_pedia/features/screens/player_detail/player_detail_screen.dart';
import 'dart:async';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/fetch_player_detail_services/fetch_player_detail_service.dart';
import 'package:player_pedia/util/app_enums.dart';

class PlayerSearchProvider with ChangeNotifier {
  List<PlayerDetail> playerDetailList = [];
  List<PlayerDetail> filterData = [];
  String _errorMessage = '';
  ApiCallStateEnum status = ApiCallStateEnum.loading;
  bool isSearch = false;
  Timer? _timer;

  //region Get initial player list
  Future<void> fetchUsers() async {
    status = ApiCallStateEnum.loading;
    _errorMessage = '';
    // notifyListeners();

    try {

      //Wait for 3 seconds
      await Future.delayed(const Duration(seconds: 3));
      List<PlayerDetail> loadedUsers = await FetchUserDetailService().getPlayerDetail(limit: 1000, offset: 0);

      playerDetailList = loadedUsers;
      status = ApiCallStateEnum.success;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load users: $e';
      status = ApiCallStateEnum.error;
      notifyListeners();
    }
  }
  //endregion


  //region On search
    Future<void> onSearch({required String searchText}) async {
      //If empty
      if(searchText.isEmpty){
        isSearch = false;
      }
      else{
        filterData = playerDetailList.where((player) {
          return player.name!.toLowerCase().contains(searchText.toLowerCase());
        }).toList();
        //Notify listeners
        isSearch = true;
      }
      notifyListeners();

    }
  //endregion



  //region On tap heart
  void onTapHeart({required String playerId}) {

      //Mark isLiked as true from playerDetailList id and if already liked then mark as false
    PlayerDetail player = playerDetailList.firstWhere((player) => player.id == playerId);
    player.isLiked = !player.isLiked!;

    //Notify listeners
    notifyListeners();
  }
  //endregion


  //region On tap player
  void onTapPlayer({required BuildContext context,required String playerId}) {
    var screen =  PlayerDetailScreen(playerId: playerId,);
    var route = CupertinoPageRoute(builder: (context) => screen);
    Navigator.push(context, route);
  }
//endregion




}
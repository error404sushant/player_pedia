import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:player_pedia/features/screens/add_edit_player_info/add_edit_player_screen.dart';
import 'package:player_pedia/features/screens/player_detail/player_detail_screen.dart';
import 'dart:async';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/storage_service/storage_service.dart';
import 'package:player_pedia/services/storage_service/storage_service_box.dart';
import 'package:player_pedia/services/storage_service/storage_service_key.dart';
import 'package:player_pedia/util/app_enums.dart';

class PlayerSearchProvider with ChangeNotifier {
  //region Common Variables
  List<PlayerDetail> playerDetailList = [];
  List<PlayerDetail> filterData = [];
  bool isAdminView = false;
  String _errorMessage = '';
  ApiCallStateEnum status = ApiCallStateEnum.loading;
  bool isSearch = false;

  //endregion

  //region Get initial player list
  Future<void> fetchUsers() async {
    status = ApiCallStateEnum.loading;
    _errorMessage = '';
    // notifyListeners();

    try {
      //Fetch data from local json
      savePlayerDataToHiveFromLocalJson();
      //Wait for 3 seconds
      // await Future.delayed(const Duration(seconds: 3));
      // List<PlayerDetail> loadedUsers = await FetchUserDetailService().getPlayerDetail(limit: 1000, offset: 0);
      //
      // playerDetailList = loadedUsers;
      status = ApiCallStateEnum.success;
    } catch (e) {
      _errorMessage = 'Failed to load users: $e';
      status = ApiCallStateEnum.error;
      notifyListeners();
    }
  }

  //endregion

  //region Add or update one player detail
  void addOrUpdateOnePlayerDetail({required PlayerDetail playerDetail}) {
    //If already exist then replace else add
    if (playerDetailList.any((element) => element.id == playerDetail.id)) {
      //Replace
      playerDetailList.removeWhere((element) => element.id == playerDetail.id);
      playerDetailList.add(playerDetail);
    } else {
      playerDetailList.add(playerDetail);
    }
    //Notify listeners
    notifyListeners();
  }

  //endregion

  //region Delete one player detail
  void deleteOnePlayerDetail({required String playerId}) {
    //Delete player detail from playerDetailList
    playerDetailList.removeWhere((element) => element.id == playerId);
    //Notify listeners
    notifyListeners();
  }
  //endregion


  //region On search
  Future<void> onSearch({required String searchText}) async {
    //If empty
    if (searchText.isEmpty) {
      isSearch = false;
    } else {
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
  void onTapHeart({required String playerId}) async {
    // Mark isLiked as true from playerDetailList id and if already liked then mark as false
    PlayerDetail player =
        playerDetailList.firstWhere((player) => player.id == playerId);

    // Update data
    player.isLiked = !player.isLiked!;

    // Notify listeners
    notifyListeners();

    // Update the Hive DB data, like and add player object to the Hive if not already present
    await HiveManager.addOrUpdateInList(
      boxName: StorageServiceBox.playerInfo,
      key: StorageServiceKey.playerDetailList,
      object: player,
      condition: (existingPlayer) =>
          (existingPlayer as PlayerDetail).id ==
          playerId, // Explicitly cast to PlayerDetail
    );
  }

  //endregion

  //region On tap add and edit
  void onTapAddAndEdit(
      { String? playerId, required BuildContext context}) async {
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => AddAndEditPlayerScreen(
                playerId: playerId,
              )),
    );
  }

  //endregion

  //region On tap player
  void onTapPlayer({required BuildContext context, required String playerId,required bool isAdminView}) {
    var screen = PlayerDetailScreen(
      playerId: playerId,
      isFromAdmin: isAdminView,
    );
    var route = CupertinoPageRoute(builder: (context) => screen);
    Navigator.push(context, route);
  }

//endregion

  //region Fetch data from local json and save in hide if there is no data
  void savePlayerDataToHiveFromLocalJson() async {
    try {
      String data =
          await rootBundle.loadString('assets/json_files/player_info.json');
      Map<String, dynamic> jsonData = await json.decode(data);

      // Assuming the JSON has a "players" array field
      List<dynamic> playersJson = jsonData['players'] ?? [];

      // Convert JSON to List<PlayerDetail>
      List<PlayerDetail> players =
          playersJson.map((player) => PlayerDetail.fromJson(player)).toList();

      //If box is not empty then take reference and add data
      //If hasKey is false then only add data
      if (!HiveManager.hasKey(
          boxName: StorageServiceBox.playerInfo,
          key: StorageServiceKey.playerDetailList)) {
        //Take reference of box
        // Box playerDetailBox = HiveManager.getBox(StorageServiceBox.playerInfo);
        // Box<List<PlayerDetail>> playerDetailBox =
        //     Hive.box(StorageServiceBox.playerInfo);

        //Add data in box
        await HiveManager.saveData<List<PlayerDetail>>(
          boxName: StorageServiceBox.playerInfo,
          key: StorageServiceKey.playerDetailList,
          value: players,
        );

        print("Data saved");

        //Add player detail in playerDetailList
        playerDetailList = players;

        //Notify listeners
        notifyListeners();
      }
      //Else add the data from json to hive
      else {
        print("Data already exist");
        List<PlayerDetail>? existingPlayers =
            (HiveManager.getData<List<dynamic>>(
          boxName: StorageServiceBox.playerInfo,
          key: StorageServiceKey.playerDetailList,
        ))?.cast<PlayerDetail>();

        //Add player detail in playerDetailList
        playerDetailList = existingPlayers!;

        //Notify listeners
        notifyListeners();
        // Log or use the fetched data
        print("Fetched ${existingPlayers.length} players from Hive.");
        // Optionally, store it in a variable for later use if needed
        // Example: _playerList = existingPlayers;
      }
    } catch (e) {
      print("Something went wrong");
    }
  }

//endregion

  //region Update ui
  void updateUi() {
    //update ui
    notifyListeners();
  }
//endregion
}

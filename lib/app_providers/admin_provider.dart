import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/player_search_provider.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/storage_service/storage_service.dart';
import 'package:player_pedia/services/storage_service/storage_service_box.dart';
import 'package:player_pedia/services/storage_service/storage_service_key.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';

class AdminProvider extends ChangeNotifier {

  //region Common
  PlayerSearchProvider? _playerSearchProvider;
  //endregion

  //region Update PlayerSearchProvider
  void updatePlayerSearchProvider(PlayerSearchProvider playerSearchProvider) {
    _playerSearchProvider = playerSearchProvider;
    notifyListeners(); // Notify listeners whenever the reference is updated
  }

  //endregion

  // region Text controllers for each field in the player data
  final TextEditingController playerName = TextEditingController();
  final TextEditingController playerAge = TextEditingController();
  final TextEditingController bestPerformance = TextEditingController();
  final TextEditingController totalScoreDay = TextEditingController();
  final TextEditingController totalScoreYear = TextEditingController();
  final TextEditingController totalWickets = TextEditingController();
  final TextEditingController photoUrl = TextEditingController();
  final TextEditingController aboutPlayer = TextEditingController();
  //endregion

  // region Form key for managing validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //endregion

  //region Populate text fields from PlayerDetail
  void populateTextFieldsFromPlayerDetail({required String playerId}) {
    PlayerDetail playerDetail = _playerSearchProvider!.playerDetailList
        .firstWhere((element) => element.id == playerId);

    playerName.text = playerDetail.name!;
    playerAge.text = playerDetail.age!.toString();
    bestPerformance.text = playerDetail.bestPerformance!;
    totalScoreDay.text = playerDetail.totalPeriodicScore!.day!.toString();
    totalScoreYear.text = playerDetail.totalPeriodicScore!.yearly!.toString();
    totalWickets.text = playerDetail.totalWickets!.toString();
    photoUrl.text = playerDetail.photoUrl!;
    aboutPlayer.text = playerDetail.aboutPlayer!;
  }

  //endregion

  //region Add and edit player
  void addAndEditPlayerDetainInHiveDb({required PlayerDetail playerDetail,required bool isEdit,required BuildContext context}) async {
    try {

      //Add id as current date time if id is null
      playerDetail.id = playerDetail.id ?? DateTime.now().toString();
      //Get the existing players from the Hive box
      List<PlayerDetail>? existingPlayers = (HiveManager.getData<List<dynamic>>(
        boxName: StorageServiceBox.playerInfo,
        key: StorageServiceKey.playerDetailList,
      ))?.cast<PlayerDetail>();

      //Add or update the player detail in the list if id exist then replace with new else add new
      if (existingPlayers!.any((player) => player.id == playerDetail.id)) {
        // Update the existing player
        existingPlayers.removeWhere((player) => player.id == playerDetail.id);
        existingPlayers.add(playerDetail);
      } else {
        // Add the new player into existingPlayers list to add in hive
        existingPlayers.add(playerDetail);
      }

      //Add or update the player detail in the player search provider
      _playerSearchProvider!.addOrUpdateOnePlayerDetail(playerDetail: playerDetail);

      //Save the updated list back to the Hive box
      await HiveManager.saveData<List<PlayerDetail>>(
        boxName: StorageServiceBox.playerInfo,
        key: StorageServiceKey.playerDetailList,
        value: existingPlayers,
      );

      print("Created");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong, Please try again later')),
      );
    }
  }

  //endregion

  //region Delete player
  Future<bool?> deletePlayer(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Sure want to delete?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("No",style: Theme.of(context).textTheme.appTitleMedium(context)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("Yes",style: Theme.of(context).textTheme.appTitleMedium(context).copyWith(color: Colors.red),),
            ),
          ],
        );
      },
    );
  }
  //endregion

  //region Delete player info
  void deletePlayerInfo({required String playerId}) async {
    //Remove player info from player search provider
    _playerSearchProvider!.deleteOnePlayerDetail(playerId: playerId);
    //Remove player info from hive
    List<PlayerDetail>? existingPlayers = (HiveManager.getData<List<dynamic>>(
      boxName: StorageServiceBox.playerInfo,
      key: StorageServiceKey.playerDetailList,
    ))?.cast<PlayerDetail>();
    //Remove one player from the existingPlayers
    existingPlayers!.removeWhere((player) => player.id == playerId);
    //Save the updated list back to the Hive box
    await HiveManager.saveData<List<PlayerDetail>>(
      boxName: StorageServiceBox.playerInfo,
      key: StorageServiceKey.playerDetailList,
      value: existingPlayers,
    );


  }


  //endregion

  //region Clear all text fields
  void clearTextFields(){
    playerName.clear();
    playerAge.clear();
    bestPerformance.clear();
    totalScoreDay.clear();
    totalScoreYear.clear();
    totalWickets.clear();
    photoUrl.clear();
    aboutPlayer.clear();
  }
  //endregion

  // region Dispose of the text controllers when the provider is disposed
  @override
  void dispose() {
    playerName.dispose();
    playerAge.dispose();
    bestPerformance.dispose();
    totalScoreDay.dispose();
    totalScoreYear.dispose();
    totalWickets.dispose();
    photoUrl.dispose();
    aboutPlayer.dispose();
    super.dispose();
  }
  //endregion
}

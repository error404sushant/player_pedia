import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/admin_provider.dart';
import 'package:player_pedia/app_providers/player_search_provider.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';
import 'package:provider/provider.dart';

class AddAndEditPlayerScreen extends StatefulWidget {
  final String? playerId;
  const AddAndEditPlayerScreen({super.key,  this.playerId});

  @override
  State<AddAndEditPlayerScreen> createState() => _AddAndEditPlayerScreenState();
}

class _AddAndEditPlayerScreenState extends State<AddAndEditPlayerScreen> {


  //initialize player search
  PlayerSearchProvider? _playerSearchProvider;
  //Initialize admin provider
  AdminProvider? _adminProvider;

  //region Init
  @override
  void initState() {
    //initialize player search
    _playerSearchProvider = Provider.of<PlayerSearchProvider>(context, listen: false);
    //Initialize admin provider
    _adminProvider = Provider.of<AdminProvider>(context, listen: false);
    //Check is it edit or add
    checkIsEditOrAdd();
    super.initState();
  }
  //endregion

  //region Dispose
  @override
  void dispose() {
    _adminProvider!.clearTextFields();
    super.dispose();
  }
  //endregion

  //region Check is it edit or add
  void checkIsEditOrAdd() {
    if(widget.playerId != null) {
      //Edit
      _adminProvider?.populateTextFieldsFromPlayerDetail(playerId: widget.playerId!);
    } else {
      return;
    }
  }
  //endregion


  //region Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(child: body()),
    );
  }
  //endregion

  //region App bar
  AppBar appBar() {
    return AppBar(
      title: Text(
        widget.playerId == null?"Add player detail":"Edit player detail",
        style: Theme.of(context).textTheme.appHeadlineSmall(context),
      ),
      actions: [

        Visibility(
          visible: widget.playerId != null,
          child: Consumer<AdminProvider>(builder: (BuildContext context, AdminProvider adminProvider, Widget? child) {
            return IconButton(onPressed: (){
              adminProvider.deletePlayer(context).then((value){

                //If null
                if(value == null || !value){
                  return;
                }
               else{
                  adminProvider.deletePlayerInfo(playerId: widget.playerId!);
                  //Show message
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Player deleted successfully')));
                  //Close screen
                  Navigator.pop(context);
                }

              });
            }, icon:const Icon(Icons.delete));
          }),
        ),

      ],
      elevation: 1,
    );
  }
  //endregion

  //region Body
  Widget body() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: createPlayerDetailForm(),
    );
  }
  //endregion

  //region Create player data form
  Widget createPlayerDetailForm() {
    return Consumer<AdminProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Form(
            key: provider.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: provider.playerName,
                  decoration: const InputDecoration(hintText: 'Player Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the player\'s name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: provider.playerAge,
                  decoration: const InputDecoration(hintText: 'Player Age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the player\'s age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: provider.bestPerformance,
                  decoration: const InputDecoration(hintText: 'Best Performance'),
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: provider.totalScoreDay,
                        decoration: const InputDecoration(hintText: 'Total Score (Day)'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: provider.totalScoreYear,
                        decoration: const InputDecoration(hintText: 'Total Score (Year)'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: provider.totalWickets,
                  decoration: const InputDecoration(hintText: 'Total Wickets'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter total wickets';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: provider.photoUrl,
                  decoration: const InputDecoration(hintText: 'Photo URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a photo URL';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: provider.aboutPlayer,
                  decoration: const InputDecoration(hintText: 'About Player'),
                  minLines: 5,
                  maxLines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a brief about the player';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (provider.formKey.currentState!.validate()) {
                      final playerDetail = PlayerDetail(
                        name: provider.playerName.text,
                        age: int.tryParse(provider.playerAge.text),
                        bestPerformance: provider.bestPerformance.text,
                        totalScoreDay: int.tryParse(provider.totalScoreDay.text),
                        totalScoreYear: int.tryParse(provider.totalScoreYear.text),
                        totalWickets: int.tryParse(provider.totalWickets.text),
                        photoUrl: provider.photoUrl.text,
                        aboutPlayer: provider.aboutPlayer.text,
                        createdAt: DateTime.now().toString(),
                        id: widget.playerId,
                        isLiked: false,
                        totalPeriodicScore: TotalPeriodicScore(
                          day: int.parse(provider.totalScoreDay.text),
                          yearly: int.parse(provider.totalScoreYear.text),
                        )
                      );
                      provider.addAndEditPlayerDetainInHiveDb(playerDetail: playerDetail,isEdit: widget.playerId != null,context: context);
                      //Close the screen
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text(widget.playerId != null?'Player details submitted successfully!':'Player details update successfully!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill in all the fields correctly.')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  //endregion
}

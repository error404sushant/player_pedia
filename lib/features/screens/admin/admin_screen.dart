import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/admin_provider.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

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
  AppBar appBar(){
    return AppBar(
      title:  Text('Admin',style: Theme.of(context).textTheme.appHeadlineMedium(context),),
      elevation: 1,

    );
  }
  //endregion


  //region Body
  Widget body(){
    return Container(
        margin: const EdgeInsets.all(15),
        child: createPlayerDetailForm());
  }
  //endregion




  //region Create player detail form
  Widget createPlayerDetailForm(){

    return Consumer<AdminProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              spacing: 20,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: provider.playerName,
                  decoration: const InputDecoration(labelText: 'Player Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the player\'s name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: provider.playerAge,
                  decoration: const InputDecoration(labelText: 'Player Age'),
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
                  decoration: const InputDecoration(labelText: 'Best Performance'),
                ),
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: provider.totalScoreDay,
                        decoration: const InputDecoration(labelText: 'Total Score (Day)'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter total score for the day';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: provider.totalScoreYear,
                        decoration: const InputDecoration(labelText: 'Total Score (Year)'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter total score for the year';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                TextFormField(
                  controller: provider.totalWickets,
                  decoration: const InputDecoration(labelText: 'Total Wickets'),
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
                  decoration: const InputDecoration(labelText: 'Photo URL'),
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
                  decoration: const InputDecoration(labelText: 'About Player'),
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
                    if (Form.of(context).validate()) {
                      // If all fields are valid, proceed with saving data
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
                      );
                      // Save the player detail (you can save it to Hive or any other storage)
                      // For example, using Hive:
                      // playerBox.add(playerDetail);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Player details submitted successfully!'),
                      ));
                    } else {
                      // Show an error if the form is not valid
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please fill in all the fields correctly.'),
                      ));
                    }
                  },
                  child: Text('Submit'),
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




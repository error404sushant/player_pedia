import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/player_detail_provider.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PlayerDetailAndMatchInfo extends StatefulWidget {
  final PlayerDetail playerDetail;

  const PlayerDetailAndMatchInfo({super.key, required this.playerDetail});

  @override
  State<PlayerDetailAndMatchInfo> createState() =>
      _PlayerDetailAndMatchInfoState();
}

class _PlayerDetailAndMatchInfoState extends State<PlayerDetailAndMatchInfo> {

  //region Build
  @override
  Widget build(BuildContext context) {
    return body();
  }

  //endregion

  //region Body
  Widget body() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          aboutPlayer(),
          periodicScore(),
          bestPerformance(),
          wickets(),
        ],
      ),
    );
  }

//endregion

  //region About player
  Widget aboutPlayer() {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About:",
          style: Theme.of(context).textTheme.appTitleMedium(context).copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
        Text(
          widget.playerDetail.aboutPlayer!,
          style: Theme.of(context).textTheme.appBodyMedium(context),
        ),
      ],
    );
    //endregion
  }

  //endregion

  //region Periodic score
  Widget periodicScore() {
    return Consumer<PlayerDetailProvider>(
      builder: (BuildContext context, PlayerDetailProvider playerDetailProvider,
          Widget? child) {
        return Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Score:",
              style:
                  Theme.of(context).textTheme.appTitleMedium(context).copyWith(
                        decoration: TextDecoration.underline,
                      ),
            ),
            //Toggle Switch
            ToggleSwitch(
              minWidth: MediaQuery.sizeOf(context).width,
              initialLabelIndex: playerDetailProvider.selectedPeriod ==
                      playerDetailProvider.periodOptions[0]
                  ? 0
                  : 1,

              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ["Day", "Yearly"],
              // icons: [Icons.male, Icons.female],
              activeBgColors: [
                [Colors.blue],
                [Colors.pink]
              ],
              onToggle: (index) {
                playerDetailProvider.onChangePeriod(index: index!);
              },
            ),
            //Day and year
            playerDetailProvider.selectedPeriod ==
                    playerDetailProvider.periodOptions[0]
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Day: ${widget.playerDetail.totalPeriodicScore!.day!.toString()}",
                      style: Theme.of(context).textTheme.appBodyMedium(context),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Yearly: ${widget.playerDetail.totalPeriodicScore!.yearly!.toString()}",
                      style: Theme.of(context).textTheme.appBodyMedium(context),
                    ),
                  ),
          ],
        );
      },
    );
  }

  //endregion

  //region Best performance
  Widget bestPerformance() {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Best Performance:",
          style: Theme.of(context).textTheme.appTitleMedium(context).copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
        Text(
          widget.playerDetail.bestPerformance!,
          style: Theme.of(context).textTheme.appBodyMedium(context),
        ),
      ],
    );
    //endregion
  }

  //endregion

  //region Wickets
  Widget wickets() {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total wickets:",
          style: Theme.of(context).textTheme.appTitleMedium(context).copyWith(
                decoration: TextDecoration.underline,
              ),
        ),
        Text(
          widget.playerDetail.totalWickets!.toString(),
          style: Theme.of(context).textTheme.appBodyMedium(context),
        ),
      ],
    );
    //endregion
  }
//endregion
}

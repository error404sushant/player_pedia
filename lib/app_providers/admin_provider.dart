import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  // Text controllers for each field in the player data
  final TextEditingController playerName = TextEditingController();
  final TextEditingController playerAge = TextEditingController();
  final TextEditingController bestPerformance = TextEditingController();
  final TextEditingController totalScoreDay = TextEditingController();
  final TextEditingController totalScoreYear = TextEditingController();
  final TextEditingController totalWickets = TextEditingController();
  final TextEditingController photoUrl = TextEditingController();
  final TextEditingController aboutPlayer = TextEditingController();












  // Dispose of the text controllers when the provider is disposed
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
}

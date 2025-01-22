import 'package:flutter/material.dart';
import 'package:player_pedia/features/screens/theme_select/widgets/theme_select_card.dart';

class ThemeSelectScreen extends StatefulWidget {
  const ThemeSelectScreen({super.key});

  @override
  State<ThemeSelectScreen> createState() => _ThemeSelectScreenState();
}

class _ThemeSelectScreenState extends State<ThemeSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


  //region Theme card
Widget themeCardd(){
    return Row(
      children: [
        //Light
        ThemeSelectCard(cardColors: Colors.white,),
        ThemeSelectCard(cardColors: Colors.black,),
      ],
    );
}
//endregion



}

import 'package:flutter/material.dart';
import 'package:player_pedia/features/screens/admin/admin_screen.dart';
import 'package:player_pedia/features/screens/player_serach/player_search_screen.dart';
import 'package:player_pedia/features/screens/select_account/widgets/select_account_card.dart';

class SelectAccountScreen extends StatefulWidget {
  const SelectAccountScreen({super.key});

  @override
  State<SelectAccountScreen> createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {


  //region Go to Admin screen
  void goToAdminScreen(){
    Navigator.pushReplacement( context,
      MaterialPageRoute(builder: (context) => AdminScreen()),
    );
  }
  //endregion

  //region Go to Search player screen
  void goToSearchPlayerScreen(){
    Navigator.pushReplacement( context,
      MaterialPageRoute(builder: (context) => PlayerSearchScreen()),
    );
  }
  //endregion




  //region Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body()),
    );
  }
  //endregion

  //region Body
  Widget body(){
  return  Center(
    child: Row(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectAccountCard(cardIcon: Icons.admin_panel_settings,cardName: "Admin",onTap: (){
          goToAdminScreen();
        },),
        SelectAccountCard(cardIcon: Icons.person,cardName: "User",onTap: (){
          goToSearchPlayerScreen();
        },),
      ],
    ),
  );
  }
  //endregion




}

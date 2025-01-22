import 'package:flutter/material.dart';

class ThemeSelectCard extends StatelessWidget {
  final Color cardColors ;
  const ThemeSelectCard({super.key, required this.cardColors});

  @override
  Widget build(BuildContext context) {
    return card();
  }




  //region Card
Widget card(){
    return Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: cardColors,
        border: Border.all(color: Colors.grey)
      ),
      child: const Icon(Icons.phone_android,size: 30,),
    );
}
//endregion


}

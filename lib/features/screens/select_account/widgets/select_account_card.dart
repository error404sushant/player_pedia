import 'package:flutter/material.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';

class SelectAccountCard extends StatefulWidget {
  final String cardName;
  final IconData cardIcon;
  final VoidCallback onTap;
  const SelectAccountCard({super.key, required this.cardName, required this.cardIcon, required this.onTap});

  @override
  State<SelectAccountCard> createState() => _SelectAccountCardState();
}

class _SelectAccountCardState extends State<SelectAccountCard> {

  //region Build
  @override
  Widget build(BuildContext context) {
    return selectCard();
  }
  //endregion

  //region Card
  Widget selectCard(){
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: InkWell(
          onTap: (){
            widget.onTap();
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Icon(widget.cardIcon,size: 100,),
                Text(widget.cardName,style: Theme.of(context).textTheme.appHeadlineMedium(context),)
              ],
            ),
          ),
        )
      );
  }
  //endregion

}

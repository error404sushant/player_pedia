import 'package:flutter/material.dart';
import 'package:player_pedia/features/common_widgets/app_image_view/app_image_view.dart';

class MatchImages extends StatefulWidget {


   const MatchImages({super.key});

  @override
  State<MatchImages> createState() => _MatchImagesState();
}

class _MatchImagesState extends State<MatchImages> {

  final List<String> cricketMatchImages = [
    'https://as2.ftcdn.net/v2/jpg/04/48/70/33/1000_F_448703360_Yl1j5l882016Uzmo52mqGx2eu9h07Apt.jpg',
    'https://as2.ftcdn.net/v2/jpg/00/00/67/77/1000_F_677762_xgBdwEgTvifSuieStC8RNJGCVwOgdQ.jpg',
    'https://as2.ftcdn.net/v2/jpg/00/23/97/11/1000_F_23971167_heseoodMBSj4irJBcLHXoyTRo2LOiQKG.jpg',
    'https://as2.ftcdn.net/v2/jpg/01/26/92/89/1000_F_126928965_WANqrNFyyLVvL35WLrV6Wpt9G6cnQFQn.jpg',
    'https://as2.ftcdn.net/v2/jpg/06/51/04/19/1000_F_651041932_tM5IdjfzKlIy7bPY4IIBHu5OR1YfnA4B.jpg',
    'https://as2.ftcdn.net/v2/jpg/02/88/86/37/1000_F_288863767_paR50mOzM3jB8g7NoeYuMm99GBKWDkDs.jpg',
  ];



  @override
  Widget build(BuildContext context) {
    return body();
  }

  //region Body
Widget body(){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,

      ),
      shrinkWrap: true,
      itemCount: cricketMatchImages.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // Cycle through a list of colors for each grid item
        return CommonCachedImage(
          imageUrl: cricketMatchImages[index],
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).width,
          borderRadius: 0,
        );
      },
    );
}
}
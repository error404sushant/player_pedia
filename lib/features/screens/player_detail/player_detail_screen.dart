import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/player_search_provider.dart';
import 'package:player_pedia/features/common_widgets/app_image_view/app_image_view.dart';
import 'package:player_pedia/features/screens/player_detail/widgets/match_images.dart';
import 'package:player_pedia/features/screens/player_detail/widgets/player_detail_and_match_info.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/util/app_common_method/app_device_util.dart';
import 'package:player_pedia/util/theme/custom_text_theme.dart';
import 'package:provider/provider.dart';

class PlayerDetailScreen extends StatefulWidget {
  final String playerId;
  final bool isFromAdmin;

  const PlayerDetailScreen({super.key, required this.playerId, required this.isFromAdmin});

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen> {
  //region Build
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerSearchProvider>(
      builder: (BuildContext context, PlayerSearchProvider playerSearchProvider,
          Widget? child) {
        //Get first player detail from list where player id is equal to player id
        PlayerDetail playerDetail = playerSearchProvider.playerDetailList
            .firstWhere((element) => element.id == widget.playerId);
        return Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
                // backgroundColor: Colors.orange,
                expandedHeight: MediaQuery.of(context).size.width * 0.6,
                floating: true,
                pinned: true,
                backgroundColor: AppDeviceUtil.isDarkMode(context)?Colors.black:Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: playerProfileImage(),
                  title: Text(
                    playerDetail.name!,
                    style: Theme.of(context).textTheme.appTitleLarge(context),
                  ),
                )),
            //Profile detail
            playerDetailAndMatchInfo(playerDetail: playerDetail),
            //Match images
            matchImages()
          ],

        ),

          // Add the floating action button here
          floatingActionButton: Visibility(
            visible: !widget.isFromAdmin,
            child: FloatingActionButton(
              onPressed: () {
                playerSearchProvider.onTapHeart(playerId: playerDetail.id!);
              },
              tooltip: 'Like',
              backgroundColor: Colors.blue,
              child: Icon(playerDetail.isLiked!?Icons.favorite:Icons.favorite_border,color:playerDetail.isLiked!?Colors.red:null ,), // Customize the color as needed
            ),
          ),
        );
      },
    );
  }
  //endregion

  //region Player Profile Image
  Widget playerProfileImage() {
    return Consumer<PlayerSearchProvider>(
      builder: (BuildContext context, PlayerSearchProvider playerSearchProvider,
          Widget? child) {
        //Get first player detail from list where player id is equal to player id
        PlayerDetail playerDetail = playerSearchProvider.playerDetailList
            .firstWhere((element) => element.id == widget.playerId);
        return Hero(
          key: Key('profile_image_${playerDetail.photoUrl}'),
          tag: "${playerDetail.id}",
          child: CommonCachedImage(
            imageUrl: playerDetail.photoUrl!,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width * 0.6,
            borderRadius: 0,
            key: Key('profile_image_${playerDetail.photoUrl}'),
          ),
        );
      },
    );
  }

//endregion

  //region Player detail and match info
  Widget playerDetailAndMatchInfo({required PlayerDetail playerDetail}) {
    return SliverToBoxAdapter(
      child: PlayerDetailAndMatchInfo(
        playerDetail: playerDetail,
      ),
    );
  }
//endregion

  //region Match images
Widget matchImages(){

    return SliverToBoxAdapter(child: Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),

          child: Text(
            "Match images:",
            style: Theme.of(context).textTheme.appTitleMedium(context).copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        MatchImages(),
      ],
    ),);
}
//endregion
}

import 'package:flutter/material.dart';
import 'package:player_pedia/app_providers/player_search_provider.dart';
import 'package:player_pedia/features/screens/player_serach/widgets/player_search_card.dart';
import 'package:player_pedia/util/app_enums.dart';
import 'package:provider/provider.dart';

class PlayerSearchScreen extends StatefulWidget {
  const PlayerSearchScreen({super.key});

  @override
  State<PlayerSearchScreen> createState() => _PlayerSearchScreenState();
}

class _PlayerSearchScreenState extends State<PlayerSearchScreen> {
  //Search provider
  late PlayerSearchProvider playerSearchProvider;

  //Text ctrl
  TextEditingController searchCtrl = TextEditingController();

  //region Init
  @override
  void initState() {
    playerSearchProvider =
        Provider.of<PlayerSearchProvider>(context, listen: false);

    playerSearchProvider.fetchUsers();

    super.initState();
  }

  //endregion

  //region Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15), child: body()),
          Expanded(child: searchResults()),
        ],
      )),
    );
  }
  //endregion

  //region Search bar
  Widget body() {
    return Consumer<PlayerSearchProvider>(
      builder: (BuildContext context, PlayerSearchProvider playerSearchProvider,
          Widget? child) {
        return TextField(
          controller: searchCtrl,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: playerSearchProvider.isSearch
                ? InkWell(
                    onTap: () {
                      searchCtrl.clear();
                      playerSearchProvider.onSearch(searchText: "");
                    },
                    child: const Icon(Icons.clear, color: Colors.grey))
                : const SizedBox(),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          ),
          onChanged: (value) {
            playerSearchProvider.onSearch(searchText: searchCtrl.text);
            // Handle search logic here
            print("Search query: $value");
          },
        );
      },
    );
  }

//endregion

  //region Search results
    Widget searchResults() {
      return Consumer<PlayerSearchProvider>(
        builder: (BuildContext context, PlayerSearchProvider playerSearchProvider,
            Widget? child) {
          //region Loading
          if (playerSearchProvider.status == ApiCallStateEnum.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          //Success
          if (playerSearchProvider.status == ApiCallStateEnum.success) {
            return playerSearchProvider.isSearch
                ? filteredList(playerSearchProvider: playerSearchProvider)
                : initialResult(playerSearchProvider: playerSearchProvider);
          }
          //Empty
          if (playerSearchProvider.status == ApiCallStateEnum.empty) {
            return const Center(child: Text("No data found"));
          }
          //Failed
          return const Center(child: Text("Something went wrong"));
        },
      );

      // return ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text('Result $index'),
      //     );
      //   },
      // );
    }

  //endregion

  //region Initial results
  Widget initialResult({required PlayerSearchProvider playerSearchProvider}) {
    //Empty
    if (playerSearchProvider.playerDetailList.isEmpty) {
      return const Center(child: Text("No data found"));
    }
    return ListView.builder(
      itemCount: playerSearchProvider.playerDetailList.length,
      itemBuilder: (context, index) {
        return PlayerSearchCard(
          id: playerSearchProvider.playerDetailList[index].id!,
          onTapHeart: () {
            playerSearchProvider.onTapHeart(
                playerId: playerSearchProvider.playerDetailList[index].id!);
          },
          isLiked: playerSearchProvider.playerDetailList[index].isLiked!,
          onTap: () {
            playerSearchProvider.onTapPlayer(
                context: context,
                playerId: playerSearchProvider.playerDetailList[index].id!);
          },
          profileUrl: playerSearchProvider.playerDetailList[index].photoUrl!,
          title: playerSearchProvider.playerDetailList[index].name!,
          subtitle:
              playerSearchProvider.playerDetailList[index].age!.toString(),
        );
      },
    );
  }

  //endregion

  //region Filtered list
  Widget filteredList({required PlayerSearchProvider playerSearchProvider}) {
    //Empty
    if (playerSearchProvider.filterData.isEmpty) {
      return const Center(child: Text("No data found"));
    }
    return ListView.builder(
      itemCount: playerSearchProvider.filterData.length,
      itemBuilder: (context, index) {
        return PlayerSearchCard(
          id: playerSearchProvider.filterData[index].id!,
          onTapHeart: () {
            playerSearchProvider.onTapHeart(
                playerId: playerSearchProvider.filterData[index].id!);
          },
          isLiked: playerSearchProvider.filterData[index].isLiked!,
          onTap: () {
            playerSearchProvider.onTapPlayer(
                context: context,
                playerId: playerSearchProvider.filterData[index].id!);
          },
          profileUrl: playerSearchProvider.filterData[index].photoUrl!,
          title: playerSearchProvider.filterData[index].name!,
          subtitle: playerSearchProvider.filterData[index].age!.toString(),
        );
      },
    );
  }
//endregion
}

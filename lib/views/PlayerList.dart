import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_racha_praia/services/PlayerService.dart';
import 'package:mobile_racha_praia/stores/PlayerStore.dart';
import 'package:mobile_racha_praia/views/AddPlayerScreen.dart';
import 'package:provider/provider.dart';

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  PlayerStore playerStore;
  void openAddPlayerScreen() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => AddPlayerScreen()));
  }

  @override
  void initState() {
    super.initState();
    playerStore = Provider.of<PlayerStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    print(playerStore.playerList);
    return Container(
      child: Scaffold(
        body: Text("body"),
        floatingActionButton: FloatingActionButton(
          onPressed: openAddPlayerScreen,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

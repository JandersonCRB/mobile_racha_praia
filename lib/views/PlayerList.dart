import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_racha_praia/models/Player.dart';
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
  void didChangeDependencies() {
    if (playerStore == null) {
      playerStore = Provider.of<PlayerStore>(context);
      playerStore.getAll();
    }
    super.didChangeDependencies();
  }

  void _openDialog(Player player) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () async {
              Navigator.pop(context);
              await playerStore.delete(player.id);
              playerStore.getAll();
            },
            child: const Text('Detalhes'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Deletar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final playerList = playerStore.playerList;
    return Container(
      child: Scaffold(
        body: ListView.builder(
          itemCount: playerList.length,
          itemBuilder: (context, index) {
            Player player = playerList[index];
            return ListTile(
              onTap: () => _openDialog(player),
              title: Text(player.name),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openAddPlayerScreen,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

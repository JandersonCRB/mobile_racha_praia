import 'package:flutter/material.dart';
import 'package:mobile_racha_praia/stores/FragmentManager.dart';
import 'package:provider/provider.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: child,
    );
  }
}

class DrawerItem {
  final String title;
  final SCREEN screen;

  DrawerItem({@required this.title, this.screen});
}

List<DrawerItem> drawerItems = [
  DrawerItem(title: "Home", screen: SCREEN.HOME),
  DrawerItem(title: "Jogadores", screen: SCREEN.PLAYER_LIST),
];

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fragmentManager = Provider.of<FragmentManager>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Racha de praia"),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ...drawerItems.map(
            (drawerItem) => ListTile(
              title: Text(drawerItem.title),
              onTap: () {
                fragmentManager.currentScreen = drawerItem.screen;
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

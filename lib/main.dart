import 'package:flutter/material.dart';
import 'package:mobile_racha_praia/stores/FragmentManager.dart';
import 'package:mobile_racha_praia/stores/PlayerStore.dart';
import 'package:mobile_racha_praia/views/PlayerList.dart';
import 'package:provider/provider.dart';

import 'components/Layout/Layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SetProviders(
        child: Layout(
          child: FragmentHolder(),
        ),
      ),
    );
  }
}

class SetProviders extends StatelessWidget {
  final Widget child;

  const SetProviders({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FragmentManager(),
        ),
        ChangeNotifierProvider.value(
          value: PlayerStore(),
        )
      ],
      child: child,
    );
  }
}

class FragmentHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var fragmentManager = Provider.of<FragmentManager>(context);
    switch (fragmentManager.currentScreen) {
      case SCREEN.HOME:
        return Text("HOME");
      case SCREEN.PLAYER_LIST:
        return PlayerList();
      default:
        return Text("ERROR");
    }
  }
}

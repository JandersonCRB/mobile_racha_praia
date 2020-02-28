import 'package:flutter/widgets.dart';

enum SCREEN {
  HOME,
  PLAYER_LIST,
}

class FragmentManager extends ChangeNotifier {
  SCREEN _currentScreen = SCREEN.PLAYER_LIST;

  SCREEN get currentScreen => _currentScreen;

  set currentScreen(SCREEN currentScreen) {
    _currentScreen = currentScreen;
    notifyListeners();
  }
}

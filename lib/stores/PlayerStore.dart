import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:mobile_racha_praia/models/Player.dart';
import 'package:mobile_racha_praia/services/PlayerService.dart';

class PlayerStore extends ChangeNotifier {
  List<Player> _playerList = [];
  bool loading = true;

  List<Player> get playerList => _playerList;

  Future<Response> getAll() {
    Future<Response> request = PlayerService.getAll();
    request.then((resp) {
      List<dynamic> jsonList = json.decode(resp.body);
      List<Player> playerList =
          jsonList.map((playerJson) => Player.fromJson(playerJson)).toList();
      _playerList = playerList;
    });
    return request;
  }
}

import 'package:mobile_racha_praia/services/HTTP.dart';

class PlayerService {
  static getAll() async {
    final request = HTTP.get('/players');
    return request;
  }
}

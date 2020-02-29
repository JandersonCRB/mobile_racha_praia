import 'package:http/http.dart';
import 'package:mobile_racha_praia/services/HTTP.dart';

class PlayerService {
  static Future<Response> getAll() async {
    return HTTP.get('/players');
  }

  static Future<Response> delete(int id) async {
    return HTTP.delete('/players/$id');
  }
}

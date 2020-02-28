import 'package:http/http.dart' as http;

const String _BASE_URL = 'http://10.0.3.2:3000';
Map<String, String> defaultHeaders = {"Content-type": "application/json"};

class HTTP {
  static Future<http.Response> get(String url, {Map<String, String> headers}) async {
    print(_BASE_URL + url);
    return http.get(_BASE_URL + url,
        headers: {...defaultHeaders, if (headers != null) ...headers});
  }
}

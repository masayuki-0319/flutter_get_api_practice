import 'package:http/http.dart' as http;

class SpeedrunApiBase {
  final _host = 'www.speedrun.com';

  Uri generateEndpoint(String path, Map<String, String> options) {
    return Uri.https(_host, path, options);
  }

  Future<http.Response> getRequest(Uri apiUri) {
    return http.get(apiUri);
  }
}

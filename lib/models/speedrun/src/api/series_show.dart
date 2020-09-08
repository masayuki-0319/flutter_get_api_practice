import 'dart:convert';

import '../models/series.dart';
import 'base.dart';

class SeriesShow extends SpeedrunApiBase {
  SeriesShow({ this.id });
  final String id;

  Uri _endpoint() {
    final path = '/api/v1/series/$id';

    return generateEndpoint(path, null);
  }

  Future<Series> request() async {
    final response = await getRequest(_endpoint());

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map;
      final mainData = jsonData['data'] as Map<String, dynamic>;
      print(mainData);

      return Series.fromJson(mainData);
    } else {
      print('Error: Failed to get seriesShow');
      return null;
    }
  }
}

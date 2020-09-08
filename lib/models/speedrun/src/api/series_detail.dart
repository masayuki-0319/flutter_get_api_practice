import 'dart:convert';

import '../models/series.dart';
import 'base.dart';

class SeriesDetail extends SpeedrunApiBase {
  Uri _endpoint(String id) {
    final path = '/api/v1/series/$id';

    return generateEndpoint(path, null);
  }

  Future<Series> request(String id) async {
    final response = await getRequest(_endpoint(id));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map;
      final mainData = jsonData['data'] as Map<String, dynamic>;
      print(mainData);

      return Series.fromJson(mainData);
    } else {
      print('Error: Failed to get seriesDetail');
      return null;
    }
  }
}

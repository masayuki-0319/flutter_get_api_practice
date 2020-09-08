import 'dart:convert';

import '../models/series.dart';
import './base.dart';

class SeriesList extends SpeedrunApiBase {
  SeriesList({ this.options = defaultOptions });
  final Map<String, String> options;

  static const path = '/api/v1/series';
  static const defaultOptions = { 'orderby': 'created' };

  Uri _endpoint() {
    return generateEndpoint(path, options);
  }

  Future<List<Series>> request() async {
    final response = await getRequest(_endpoint());

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map;
      final mainData = jsonData['data'].cast<Map<String, dynamic>>()
          as List<Map<String, dynamic>>;
      print(mainData);

      return mainData.map((json) => Series.fromJson(json)).toList();
    } else {
      print('Error: Failed to get seriesList');
      return null;
    }
  }
}

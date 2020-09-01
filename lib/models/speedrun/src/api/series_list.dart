import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/series.dart';

class SeriesList {
  final path = 'series';

  Uri seriesUri() {
    return Uri.https('www.speedrun.com', '/api/v1/$path', { 'orderby': 'created' });
  }

  Future<List<Series>> getSeriesList() async {
    final response = await http.get(seriesUri());

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

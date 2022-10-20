import 'dart:convert';
import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class StatisticService {
  Future<StatisticModel> getStatistic() async {
    var url = Uri.parse(Urls.statistic);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      StatisticModel statistic = StatisticModel.fromJson(data);

      return statistic;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}

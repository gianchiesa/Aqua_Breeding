import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/grading_chart_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FishGradingService {
  Future<List<FishGrading>> fetchFishGradings(
      {required String activationId}) async {
    var url = Uri.parse(Urls.fishGrading(activationId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FishGrading> fishgradings = FishGrading.fromJsonList(data);
      print("success add fishgradings");
      return fishgradings;
    } else {
      throw Exception('Gagal Get fishgradings!');
    }
  }

  Future<FishGradingChart> fetchChartFishGradings(
      {required String activationId}) async {
    var url = Uri.parse(Urls.fishGradingsGraph(activationId));
    var headers = {'Content-Type': 'application/json'};
    print(url);

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      FishGradingChart fishGradingChart = FishGradingChart.fromJson(data);
      print("success get fish grading chart");
      return fishGradingChart;
    } else {
      throw Exception('Gagal Get fishgradings!');
    }
  }

  Future<bool> postFishGrading({
    required String? pondId,
    required String? avgWeight,
    required String? sampleAmount,
    required String? sampleWeight,
    required String? sampleLength,
  }) async {
    final response = await http.post(
      Uri.parse(Urls.fishGradings),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId,
        "avg_weight": avgWeight,
        "sample_amount": sampleAmount,
        "sample_weight": sampleWeight,
        "sample_long": sampleLength,
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}

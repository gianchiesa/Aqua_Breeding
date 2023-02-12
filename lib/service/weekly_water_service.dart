import 'dart:convert';
import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class WeeklyWaterService {
  Future<List<WeeklyWater>> getDatas() async {
    var url = Uri.parse(Urls.weeklyWater);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<WeeklyWater> ponds = [];

      for (var item in data) {
        ponds.add(WeeklyWater.fromJson(item));
      }

      print(ponds);

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }

  Future<bool> postWeeklyWater({
    required String? pondId,
    required String? activationId,
    required String? floc,
    String? ammonia,
    String? nitrite,
    String? nitrate,
    String? hardness,
    String? week,
  }) async {
    print({
      "pond_id": pondId.toString(),
      "pond_activation_id": activationId.toString(),
      "floc": floc,
      "nitrite": nitrate,
      "nitrate": nitrate,
      "ammonia": ammonia,
      "hardness": hardness,
      "week": week,
    });
    final response = await http.post(
      Uri.parse(Urls.weeklyWater),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId.toString(),
        "pond_activation_id": activationId.toString(),
        "floc": floc,
        "nitrite": nitrate,
        "nitrate": nitrate,
        "ammonia": ammonia,
        "hardness": hardness,
        "week": week,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}

import 'dart:convert';
import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FishDeathService {
  Future<List<FishDeath>> fetchFishDeaths(
      {required String activationId}) async {
    var url = Uri.parse(Urls.fishDeath(activationId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FishDeath> fishdeath = FishDeath.fromJsonList(data);
      print("success add fishdeath");
      return fishdeath;
    } else {
      throw Exception('Gagal Get fishdeath!');
    }
  }

  Future<bool> postFishDeath({
    required String? pondId,
    required List fish,
  }) async {
    print({"pond_id": pondId, "fish_death_amount": fish});
    final response = await http.post(
      Uri.parse(Urls.fishDeaths),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId,
        "fish_death_amount": fish.toString(),
        "diagnosis": "mati karena sakit"
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

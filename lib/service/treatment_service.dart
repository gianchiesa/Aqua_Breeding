import 'dart:convert';
import 'package:fish/models/treatment_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class TreatmentService {
  Future<List<Treatment>> getTreatmentList() async {
    var url = Uri.parse(Urls.treatment);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Treatment> treatments = [];

      for (var item in data) {
        treatments.add(Treatment.fromJson(item));
      }
      // Treatment treatment = Treatment.fromJson(data[0]);
      // print(data[1]);
      return treatments;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }

  Future<bool> postPondTreatment({
    required String? pondId,
    String? salt,
    String? type,
    String? probiotic,
    String? water,
    String? desc,
    String? carbohydrate,
    String? carbohydrate_type,
  }) async {
    print({
      "pond_id": pondId.toString(),
      "salt": salt,
      "treatment_type": type,
      "probiotic_culture": probiotic,
      "water_change": water,
      "description": desc,
      "carbohydrate": carbohydrate,
      "carbohydrate_type": carbohydrate_type,
    });
    final response = await http.post(
      Uri.parse(Urls.treatment),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId,
        "salt": salt,
        "treatment_type": type,
        "probiotic_culture": probiotic,
        "water_change": water,
        "description": desc.toString(),
        "carbohydrate": carbohydrate,
        "carbohydrate_type": carbohydrate_type,
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

  Future<bool> postPondTreatmentBerat(
      {required String? pondId,
      String? type,
      String? desc,
      required num? total_fish_harvested,
      required num? total_weight_harvested,
      List? fish_harvested,
      bool? isFinish}) async {
    print({
      "pond_id": pondId.toString(),
      "treatment_type": type,
      "description": desc,
    });
    final response = await http.post(
      Uri.parse(Urls.treatment),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId,
        "treatment_type": type,
        "description": desc.toString(),
        "total_weight_harvested": total_weight_harvested.toString(),
        "total_fish_harvested": total_fish_harvested.toString(),
        "fish": fish_harvested.toString()
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

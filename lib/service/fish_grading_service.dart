import 'dart:convert';
import 'package:fish/models/fishGrading_model.dart';
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

  Future<bool> postFishGrading({
    required String? pondId,
    required String? fishType,
    required String? samplingAmount,
    required String? avgFishWeight,
    required String? avgFishLong,
    required String? amountNormal,
    required String? amountOver,
    required String? amountUnder,
  }) async {
    print({
      "pond_id": pondId.toString(),
      "fish_type": fishType,
      "sampling_amount": samplingAmount,
      "avg_fish_weight": avgFishWeight,
      "avg_fish_long": avgFishLong,
      "amount_normal_fish": amountNormal,
      "amount_oversize_fish": amountOver,
      "amount_undersize_fish": amountUnder,
    });
    final response = await http.post(
      Uri.parse(Urls.fishGradings),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId,
        "fish_type": fishType,
        "sampling_amount": samplingAmount,
        "avg_fish_weight": avgFishWeight,
        "avg_fish_long": avgFishLong,
        "amount_normal_fish": amountNormal,
        "amount_oversize_fish": amountOver,
        "amount_undersize_fish": amountUnder,
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

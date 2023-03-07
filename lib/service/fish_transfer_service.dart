import 'dart:convert';
import 'dart:developer';
import 'package:fish/models/fish_transfer_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class FishTransferService {
  Future<List<FishTransfer>> getFishTransferList() async {
    var url = Uri.parse(Urls.fishtransfer);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<FishTransfer> transferhistory = [];

      for (var item in data) {
        transferhistory.add(FishTransfer.fromJson(item));
      }
      // Treatment treatment = Treatment.fromJson(data[0]);
      // print(data[1]);
      return transferhistory;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }

  Future<bool> postFishTransfer({
    required String? origin_pond_id,
    required String? destination_pond_id,
    required String? transfer_method,
    required String? transfer_type,
    required String? sample_weight,
    required String? sample_long,
    required List? fish,
  }) async {
    print({
      "origin_pond_id": origin_pond_id.toString(),
      "destination_pond_id": destination_pond_id.toString(),
      "transfer_method": transfer_method,
      "transfer_type": transfer_type,
      "sample_long": sample_long,
      "sample_weight": sample_weight,
      "fish": fish.toString()
    });
    final response = await http.post(
      Uri.parse(Urls.fishtransfer),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "origin_pond_id": origin_pond_id.toString(),
        "destination_pond_id": destination_pond_id.toString(),
        "transfer_method": transfer_method,
        "transfer_type": transfer_type,
        "sample_long": sample_long,
        "sample_weight": sample_weight,
        "fish": fish.toString()
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

  Future<bool> postFishTransferKering(
      {required String? origin_pond_id,
      required String? destination_pond_id,
      required String? transfer_method,
      required String? transfer_type,
      required String? sample_weight,
      required String? sample_long,
      required List? fish,
      required List? fishstock,
      required List? fishharvested,
      required num? total_fish_harvested,
      required num? total_weight_harvested,
      String? water_level}) async {
    print({
      "origin_pond_id": origin_pond_id.toString(),
      "destination_pond_id": destination_pond_id.toString(),
      "transfer_method": transfer_method,
      "transfer_type": transfer_type,
      "sample_long": sample_long,
      "sample_weight": sample_weight,
      "fish": fish.toString(),
      "fish_stock": fishstock.toString(),
      "fish_harvested": fishharvested.toString(),
      "total_weight_harvested": total_weight_harvested.toString(),
      "total_fish_harvested": total_fish_harvested.toString(),
      "water_level": water_level
    });
    final response = await http.post(
      Uri.parse(Urls.fishtransfer),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "origin_pond_id": origin_pond_id.toString(),
        "destination_pond_id": destination_pond_id.toString(),
        "transfer_method": transfer_method,
        "transfer_type": transfer_type,
        "sample_long": sample_long,
        "sample_weight": sample_weight,
        "fish": fish.toString(),
        "fish_stock": fishstock.toString(),
        "fish_harvested": fishharvested.toString(),
        "total_weight_harvested": total_weight_harvested.toString(),
        "total_fish_harvested": total_fish_harvested.toString(),
        "water_level": water_level
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

  // Future<bool> postPondTreatmentBerat(
  //     {required String? pondId,
  //     String? type,
  //     String? desc,
  //     required num? total_fish_harvested,
  //     required num? total_weight_harvested,
  //     List? fish_harvested,
  //     bool? isFinish}) async {
  //   print({
  //     "pond_id": pondId.toString(),
  //     "treatment_type": type,
  //     "description": desc,
  //   });
  //   final response = await http.post(
  //     Uri.parse(Urls.treatment),
  //     headers: {
  //       "Content-Type": "application/x-www-form-urlencoded",
  //     },
  //     encoding: Encoding.getByName('utf-8'),
  //     body: {
  //       "pond_id": pondId,
  //       "treatment_type": type,
  //       "description": desc.toString(),
  //       "total_weight_harvested": total_weight_harvested.toString(),
  //       "total_fish_harvested": total_fish_harvested.toString(),
  //       "fish": fish_harvested.toString()
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     return true;
  //   } else {
  //     print(response.body);
  //     return false;
  //   }
  // }
}

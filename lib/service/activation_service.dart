import 'dart:convert';
import 'dart:developer';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fish_live_model.dart';
import 'package:fish/models/fishchart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ActivationService {
  Future<List<Activation>> getActivations({required String pondId}) async {
    var url = Uri.parse(Urls.activation(pondId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Activation> activations = [];

      for (var item in data["pond_activation_list"]) {
        activations.add(Activation.fromJson(item));
      }

      print("success get activations");
      print(activations);
      return activations;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }

  Future<List<FishChartData>> getFishChart(
      {required String activationId}) async {
    var url = Uri.parse(Urls.fishChart(activationId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      List<FishChartData> fishDatas = FishChartData.fromJsonList(data);

      return fishDatas;
    } else {
      throw Exception('Gagal Get fish chart!');
    }
  }

  Future<bool> postActivation(
      {required String? pondId,
      required List? fish,
      required bool? isWaterPreparation,
      required String? waterLevel,
      required Function doInPost}) async {
    final response = await http.post(Uri.parse(Urls.pondActivation(pondId)),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "fish": fish.toString(),
          "isWaterPreparation": false.toString(),
          "water_level": waterLevel,
        });

    if (response.statusCode == 200) {
      doInPost();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> postDeactivation(
      {required String? pondId,
      required num? total_fish_harvested,
      required String? total_weight_harvested,
      List? fish_harvested,
      bool? isFinish,
      required Function doInPost,
      required BuildContext context}) async {
    if (total_weight_harvested!.toString().isNotEmpty) {
      if (total_weight_harvested.contains(",")) {
        total_weight_harvested =
            total_weight_harvested.toString().replaceAll(',', '.');
      }
    }

    final response = await http.post(Uri.parse(Urls.pondDeactivation(pondId)),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "total_weight_harvested": total_weight_harvested.toString(),
          "total_fish_harvested": total_fish_harvested.toString(),
          "fish": fish_harvested.toString()
        });

    if (response.statusCode == 200) {
      print('sukses deaktifasi');
      doInPost();
      Navigator.pop(context);

      return true;
    } else {
      print(response);
      return false;
    }
  }

  Future<bool> postAddFishInActivation(
      {required String? pondId,
      required List? fish,
      required Function doInPost}) async {
    final response = await http.post(Uri.parse(Urls.addFish),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "pond_id": pondId,
          "fish": fish.toString(),
        });
    inspect(response);
    if (response.statusCode == 200) {
      doInPost();
      return true;
    } else {
      return false;
    }
  }
}

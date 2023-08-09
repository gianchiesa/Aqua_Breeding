import 'dart:convert';
import 'dart:developer';
import 'package:fish/models/fish_transfer_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:flutter/material.dart';
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

      print("ini leght transfer ${transferhistory.length}");
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

  Future<bool> postTransfer(
      {required String origin_pond_id,
      required String transfer_method,
      required String total_fish_harvested,
      required String total_weight_harvested,
      required String amountUndersize,
      required String amountOversize,
      required String amountNormal,
      required String sampleWeight,
      required String sampleLong,
      required String sampleAmount,
      required List<dynamic> transferList,
      required List<dynamic> fishDeath,
      required BuildContext ctx}) async {
    List<dynamic> transferListPost = [];
    for (var i in transferList) {
      final fish = [];
      for (var j in i["fish"]) {
        var k = json.decode(j);
        print("ini daata for ${k["type"]}");
        final datafish = {
          "type": k["type"],
          "amount": int.parse(k["amount"]),
          "weight": double.parse(k["weight"])
        };
        fish.add(datafish);
        print("ini fish baru $fish");
      }
      final datas = {
        "destination_pond_id": i["destination_pond_id"],
        "status": i["status"],
        "fish": fish,
        "sample_weight": double.parse(i["sample_weight"]),
        "sample_long": double.parse(i['sample_long']),
        "transfer_type": i["transfer_type"],
        if (i["status"] == "isNotActivated") ...{
          "water_level": int.parse(i["water_level"])
        }
      };
      transferListPost.add(datas);
    }
    print({
      "origin_pond_id": origin_pond_id.toString(),
      "fish_sort_type": transfer_method,
      "total_fish_harvested": total_fish_harvested,
      "total_weight_harvested": total_weight_harvested,
      "sample_long": sampleLong,
      "sample_amount": sampleAmount,
      "sample_weight": sampleWeight,
      "amount_oversize": amountOversize,
      "amount_undersized": amountUndersize,
      "amount_normal": amountNormal,
      "transfer_list": json.encode(transferListPost),
      "fish_death": json.encode(fishDeath)
    });

    final response = await http.post(
      Uri.parse(Urls.newfishtransfer),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "origin_pond_id": origin_pond_id.toString(),
        "fish_sort_type": transfer_method,
        "total_fish_harvested": total_fish_harvested,
        "total_weight_harvested": total_weight_harvested,
        "sample_long": sampleLong,
        "sample_amount": sampleAmount,
        "sample_weight": sampleWeight,
        "amount_oversize": amountOversize,
        "amount_undersized": amountUndersize,
        "amount_normal": amountNormal,
        "transfer_list": json.encode(transferListPost),
        if (transfer_method == "kering") ...{
          "fish_death": json.encode(fishDeath)
        }
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      final snackBar = SnackBar(
        content: const Text('Sortir Ikan Berhasil!'),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
      return true;
    } else {
      print(response.body);
      final snackBar = SnackBar(
        content: Text(response.body.toString()),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(ctx).showSnackBar(snackBar);

      print("gagal post");

      return false;
    }
  }
}

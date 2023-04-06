import 'dart:convert';
import 'package:fish/models/farm_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<List<Farm>> getFarm() async {
    var url = Uri.parse(Urls.farm);
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Farm> farm = [];

      for (var item in data) {
        farm.add(Farm.fromJson(item));
      }

      print(farm);

      return farm;
    } else {
      throw Exception('Gagal Get farm!');
    }
  }

  Future<bool> pondRegister(
      {required String? alias,
      required String? location,
      required String? shape,
      required String? material,
      required String? length,
      required String? width,
      required String? diameter,
      required String? height,
      required String? status}) async {
    final response = await http.post(
      Uri.parse(Urls.ponds),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "alias": alias,
        "location": location,
        "shape": shape,
        "material": material,
        "status": status,
        "length": length,
        "width": width,
        "diameter": diameter,
        "height": height,
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

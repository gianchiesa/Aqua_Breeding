import 'dart:convert';
import 'package:fish/models/breeder_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  Future<Breeder> getBreeder() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    var url = Uri.parse(Urls.breeder);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Breeder breeder = Breeder.fromJson(data);

      print(breeder);

      return breeder;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }
}

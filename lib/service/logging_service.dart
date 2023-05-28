import 'dart:convert';
import 'package:fish/service/url_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoggingData {
  String? breederId;
  String? farmId;
  String? farmName;
  String? breederName;

  LoggingData(
      {required this.breederId,
      required this.farmId,
      required this.breederName,
      required this.farmName});

  LoggingData.fromJson(Map<String, dynamic> json) {
    breederId = json["id"];
    breederName = json["username"];
    farmId = json["farm_id"];
    farmName = json["farm_name"];
  }
}

class LoggingService {
  Future<bool> postLogging(
      {required DateTime startAt, required String? fitur}) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var identity = prefs.getString('identity').toString();
    // final data = LoggingData.fromJson(identity);
    // String json = jsonEncode(identity);
    identity = identity.replaceAll('{', '{"');
    identity = identity.replaceAll(': ', '": "');
    identity = identity.replaceAll(', ', '", "');
    identity = identity.replaceAll('}', '"}');
    final jsonOutput = json.decode(identity);
    final response = await http.post(
      Uri.parse(Urls.logging),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "farm_id": jsonOutput["farm_id"],
        "breeder_id": jsonOutput["id"],
        "feature_name": fitur,
        "start_at": startAt.toString(),
        "breeder_name": jsonOutput["username"],
        "farm_name": jsonOutput["farm_name"]
      },
    );
    print('testing print');
    if (response.statusCode == 200) {
      print('tidak eror');
      print(response.body);
      return true;
    } else {
      print('eror');

      print(response.body);
      return false;
    }
  }
}

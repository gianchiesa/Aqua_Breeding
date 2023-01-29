import 'dart:convert';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class PondService {
  Future<List<Pond>> getPonds() async {
    var url = Uri.parse(Urls.ponds);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Pond> ponds = [];

      for (var item in data) {
        ponds.add(Pond.fromJson(item));
      }

      print(ponds);

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }

  Future<void> getPondDetail({required String pondId}) async {
    var url = Uri.parse(Urls.pond(pondId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Pond pond = Pond.fromJson(data);
      // print(pond);

      // return pond;
    } else {
      throw Exception('Gagal Get Detial Pond!');
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

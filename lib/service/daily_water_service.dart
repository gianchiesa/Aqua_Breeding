import 'dart:convert';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class DailyWaterService {
  Future<List<DailyWater>> getPonds() async {
    var url = Uri.parse(Urls.dailyWater);
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<DailyWater> ponds = [];

      for (var item in data) {
        ponds.add(DailyWater.fromJson(item));
      }

      print(ponds);

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }

  // Future<void> getPondDetail({required String pondId}) async {
  //   var url = Uri.parse(Urls.pond(pondId));
  //   var headers = {'Content-Type': 'application/json'};

  //   var response = await http.get(url, headers: headers);

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     // Pond pond = Pond.fromJson(data);
  //     // print(pond);

  //     // return pond;
  //   } else {
  //     throw Exception('Gagal Get Detial Pond!');
  //   }
  // }
  Future<bool> postDailyWater({
    required String? pondId,
    required String? activationId,
    required String? ph,
    required String? numDo,
    String? week,
    required String? temperature,
  }) async {
    print({
      "pond_id": pondId.toString(),
      "pond_activation_id": activationId.toString(),
      "ph": ph,
      "do": numDo,
      "week": week,
      "temperature": temperature,
    });
    final response = await http.post(
      Uri.parse(Urls.dailyWater),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "pond_id": pondId.toString(),
        "pond_activation_id": activationId.toString(),
        "ph": ph,
        "week": week,
        "do": numDo,
        "temperature": temperature,
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

  Future<bool> editDailyWater(
      {required String? dailywaterId,
      required String? ph,
      required String? numDo,
      required String? temperature}) async {
    print({
      "ph": ph,
      "do": numDo,
      "temperature": temperature,
    });
    final response = await http.put(
      Uri.parse(Urls.dailyWaterbyid(dailywaterId)),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "ph": ph,
        "do": numDo,
        "temperature": temperature,
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

  Future<DailyWater> DeleteDatas({required String dailywaterId}) async {
    var url = Uri.parse(Urls.dailyWaterbyid(dailywaterId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.delete(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      return DailyWater.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }

  Future<List<DailyWater>> getDatas({required String dailywaterId}) async {
    var url = Uri.parse(Urls.dailyWaterbyid(dailywaterId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<DailyWater> ponds = [];
      ponds.add(DailyWater.fromJson(data));

      print(ponds);

      return ponds;
    } else {
      throw Exception('Gagal Get Ponds!');
    }
  }
}

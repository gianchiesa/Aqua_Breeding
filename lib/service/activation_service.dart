import 'dart:convert';
import 'package:fish/models/activation_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:http/http.dart' as http;

class ActivationService {
  Future<List<Activation>> getActivations({required String pondId}) async {
    var url = Uri.parse(Urls.activation(pondId));
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Activation> activations = [];

      for (var item in data["pond_activation_list"]) {
        activations.add(Activation.fromJson(item));
      }

      print("success add activations");

      return activations;
    } else {
      throw Exception('Gagal Get Activation!');
    }
  }

  Future<bool> postActivation({
    required String? pondId,
    required List? fish,
    required bool? isWaterPreparation,
    required String? waterLevel,
  }) async {
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
      print(response.body);
      return true;
    } else {
      print(response.body);
      return false;
    }
  }
}

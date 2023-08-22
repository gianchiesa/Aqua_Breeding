import 'dart:convert';
import 'dart:math';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/url_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

class PondService {
  Future<List<Pond>> getPonds() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    var url = Uri.parse(Urls.ponds);
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Pond> ponds = [];

      for (var item in data) {
        ponds.add(Pond.fromJson(item));
      }

      print(ponds);
      print("ini ponds data $ponds");
      return ponds;
    } else {
      throw Exception(e);
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
      required String? status,
      required Function doInPost,
      required BuildContext context}) async {
    if (diameter!.isNotEmpty) {
      if (diameter.contains(",")) {
        diameter = diameter.replaceAll(',', '.');
      }
    }
    if (length!.isNotEmpty) {
      if (length.contains(",")) {
        length = length.replaceAll(',', '.');
      }
    }
    if (width!.isNotEmpty) {
      if (width.contains(",")) {
        width = width.replaceAll(',', '.');
      }
    }
    if (height!.isNotEmpty) {
      if (height.contains(",")) {
        height = height.replaceAll(',', '.');
      }
    }
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    final response = await http.post(
      Uri.parse(Urls.ponds),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
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
      doInPost();
      Navigator.pop(context);
      return true;
    } else {
      var res = jsonDecode(response.body);

      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Input Error',
                    style: TextStyle(color: Colors.red)),
                content: Text(
                  '${res["message"]}',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: backgroundColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
      return false;
    }
  }

  Future<bool> pondEdit(
      {required String? alias,
      required String id,
      required String? location,
      required String? shape,
      required String? material,
      required String? length,
      required String? width,
      required String? diameter,
      required String? height,
      required String? status,
      required BuildContext context}) async {
    if (diameter!.isNotEmpty) {
      if (diameter.contains(",")) {
        diameter = diameter.replaceAll(',', '.');
      }
    } else {
      diameter = 0.toString();
    }
    if (length!.isNotEmpty) {
      if (length.contains(",")) {
        length = length.replaceAll(',', '.');
      }
    } else {
      length = 0.toString();
    }
    if (width!.isNotEmpty) {
      if (width.contains(",")) {
        width = width.replaceAll(',', '.');
      }
    } else {
      width = 0.toString();
    }
    if (height!.isNotEmpty) {
      if (height.contains(",")) {
        height = height.replaceAll(',', '.');
      }
    } else {
      height = 0.toString();
    }
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    final response = await http.put(
      Uri.parse('${Urls.ponds}/$id'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        'Authorization': 'Bearer $token'
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
      // doInPost();

      // Get.back();
      final snack = const SnackBar(
        backgroundColor: Colors.green,
        content: Text("Berhasil update data"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
      return true;
    } else {
      var res = jsonDecode(response.body);
      print("ini masuk kesini ${res['message']}");
      // Navigator.pop(context);

      SnackBar(
        backgroundColor: Colors.red,
        content: Text(res["message"]),
      );
      // showDialog<String>(
      //     context: context,
      //     builder: (BuildContext context) => AlertDialog(
      //           title: const Text('Input Error',
      //               style: TextStyle(color: Colors.red)),
      //           content: Text(
      //             '${res["message"]}',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //           backgroundColor: backgroundColor1,
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(16.0))),
      //           actions: <Widget>[
      //             TextButton(
      //               onPressed: () => Navigator.pop(context, 'OK'),
      //               child: const Text('OK'),
      //             ),
      //           ],
      //         ));
      return false;
    }
  }
}

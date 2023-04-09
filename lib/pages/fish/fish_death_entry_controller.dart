import 'dart:convert';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/fish/fish_type_controller.dart';
import 'package:fish/service/fish_death_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';

class FishDeathEntryController extends GetxController {
  TextEditingController formDeathController = TextEditingController(text: '');
  FishTypeController fishTypeController = FishTypeController();
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final fishamount = ''.obs;
  final validatefishamount = false.obs;
  var isLoading = false.obs;

  void fishamountChanged(String val) {
    fishamount.value = val;
  }

  void valfishamount() {
    validatefishamount.value = true;
  }

  List buildJson() {
    var list = [];
    var data = {
      "type": fishTypeController.selected.value,
      "amount": formDeathController.value.text,
    };
    list.add(jsonEncode(data));
    return list;
  }

  Future<void> postFishDeath() async {
    bool value = await FishDeathService().postFishDeath(
      pondId: pond.id,
      fish: buildJson(),
    );
    print(value);
  }
}

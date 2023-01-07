import 'dart:convert';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/fish/fish_type_controller.dart';
import 'package:fish/service/fish_death_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FishDeathEntryController extends GetxController {
  TextEditingController formDeathController = TextEditingController(text: '');
  FishTypeController fishTypeController = FishTypeController();
  Pond pond = Get.arguments();

  var isLoading = false.obs;

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
    Get.back();
  }
}

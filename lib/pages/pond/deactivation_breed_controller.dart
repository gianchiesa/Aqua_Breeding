import 'dart:convert';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/service/activation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeactivationBreedController extends GetxController {
  Pond pond = Get.arguments()["pond"];
  Activation activation = Get.arguments()["activation"][0];
  // Activation activation = Get.arguments()["activation"];
  // Future<List<Activation>> activationsData =
  //       ActivationService().getActivations(pondId: pond.id!);
  // TextEditingController waterHeightController = TextEditingController(text: '');
  TextEditingController nilaMerahAmountController =
      TextEditingController(text: '');
  TextEditingController nilaMerahWeightController =
      TextEditingController(text: '');
  TextEditingController nilaHitamAmountController =
      TextEditingController(text: '');
  TextEditingController nilaHitamWeightController =
      TextEditingController(text: '');
  TextEditingController leleAmountController = TextEditingController(text: '');
  TextEditingController leleWeightController = TextEditingController(text: '');
  TextEditingController patinAmountController = TextEditingController(text: '');
  TextEditingController patinWeightController = TextEditingController(text: '');
  TextEditingController masAmountController = TextEditingController(text: '');
  TextEditingController masWeightController = TextEditingController(text: '');
  var isLoading = false.obs;
  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;
  var isLele = false.obs;
  var isPatin = false.obs;
  var isMas = false.obs;

  void setLele(bool value) {
    isLele.value = value;
  }

  void setNilaMerah(bool value) {
    isNilaMerah.value = value;
  }

  void setNilaHitam(bool value) {
    isNilaHitam.value = value;
  }

  void setPatin(bool value) {
    isPatin.value = value;
  }

  void setMas(bool value) {
    isMas.value = value;
  }

  List buildJsonFish() {
    var data = [];
    if (isNilaMerah.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": nilaMerahAmountController.value.text,
        "weight": nilaMerahWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitam.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": nilaHitamAmountController.value.text,
        "weight": nilaHitamWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isLele.value == true) {
      var fishData = {
        "type": "lele",
        "amount": leleAmountController.value.text,
        "weight": leleWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatin.value == true) {
      var fishData = {
        "type": "patin",
        "amount": patinAmountController.value.text,
        "weight": patinWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isMas.value == true) {
      var fishData = {
        "type": "mas",
        "amount": masAmountController.value.text,
        "weight": masWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

  Future<void> pondDeactivation() async {
    print(buildJsonFish());
    // bool value = await ActivationService().postActivation(
    //   pondId: pond.id,
    //   fish: buildJsonFish(),
    //   isWaterPreparation: false,
    //   waterLevel: waterHeightController.value.text,
    // );
    // print(value);
    // Get.to(() => DashboardPage());
  }
}

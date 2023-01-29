import 'dart:convert';
import 'dart:ffi';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fish_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/service/activation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeactivationBreedController extends GetxController {
  Pond pond = Get.arguments()['pond'];
  // Activation activation = Get.arguments["activation"][0];
  ActivationService service = ActivationService();

  // Activation activation = Get.arguments["activation"];
  // Future<List<Activation>> activationsData =
  //       ActivationService().getActivations(pondId: pond.id!);
  // TextEditingController waterHeightController = TextEditingController(text: '');

  TextEditingController nilaMerahWeightController =
      TextEditingController(text: '');

  TextEditingController nilaHitamWeightController =
      TextEditingController(text: '');
  TextEditingController leleWeightController = TextEditingController(text: '');

  TextEditingController patinWeightController = TextEditingController(text: '');
  TextEditingController masWeightController = TextEditingController(text: '');
  var isLoading = false.obs;
  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;
  var isLele = false.obs;
  var isPatin = false.obs;
  var isMas = false.obs;
  var nilamerahAmount = 0.obs;
  var nilahitamAmount = 0.obs;
  var leleAmount = 0.obs;
  var patinAmount = 0.obs;
  var masAmount = 0.obs;
  var nilamerahWeight = 0.obs;
  var nilahitamWeight = 0.obs;
  var leleWeight = 0.obs;
  var patinWeight = 0.obs;
  var masWeight = 0.obs;
  var isDeactivationProgress = false.obs;

  Future<void> getHarvestedBool(Activation activation) async {
    for (var i in activation.fishLive!) {
      if (i.type == 'lele') {
        isLele.value = true;
        leleAmount.value = i.amount!;
      }
      if (i.type == 'patin') {
        isPatin.value = true;
        patinAmount.value = i.amount!;
      }
      if (i.type == 'mas') {
        isMas.value = true;
        masAmount.value = i.amount!;
      }
      if (i.type == 'nila hitam') {
        isNilaHitam.value = true;
        nilahitamAmount.value = i.amount!;
      }
      if (i.type == 'nila merah') {
        isNilaMerah.value = true;
        nilamerahAmount.value = i.amount!;
      }
    }
  }

  List buildJsonFish() {
    var data = [];
    if (isNilaMerah.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": nilamerahAmount.toString(),
        "weight": nilaMerahWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitam.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": nilahitamAmount.toString(),
        "weight": nilaHitamWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isLele.value == true) {
      var fishData = {
        "type": "lele",
        "amount": leleAmount.toString(),
        "weight": leleWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatin.value == true) {
      var fishData = {
        "type": "patin",
        "amount": patinAmount.toString(),
        "weight": patinWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isMas.value == true) {
      var fishData = {
        "type": "mas",
        "amount": masAmount.toString(),
        "weight": masWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

  int getWeight() {
    int weightTotal = 0;
    if (isNilaMerah.value == true) {
      weightTotal += int.parse(nilaMerahWeightController.value.text);
    }
    if (isNilaHitam.value == true) {
      weightTotal += int.parse(nilaHitamWeightController.value.text);
    }
    if (isLele.value == true) {
      weightTotal += int.parse(leleWeightController.value.text);
    }
    if (isPatin.value == true) {
      weightTotal += int.parse(patinWeightController.value.text);
    }
    if (isMas.value == true) {
      weightTotal += int.parse(masWeightController.value.text);
    }
    return weightTotal;
  }

  Future<void> pondDeactivation(BuildContext context, Function doInPost) async {
    // print(buildJsonFish());
    isDeactivationProgress.value = true;
    try {
      await service.postDeactivation(
          pondId: pond.id,
          total_fish_harvested: leleAmount.toInt() +
              patinAmount.toInt() +
              masAmount.toInt() +
              nilahitamAmount.toInt() +
              nilamerahAmount.toInt(),
          total_weight_harvested: getWeight(),
          isFinish: true,
          fish_harvested: buildJsonFish());
      doInPost();
      print(buildJsonFish());
    } catch (e) {
      //
    }
    isDeactivationProgress.value = false;
  }
}

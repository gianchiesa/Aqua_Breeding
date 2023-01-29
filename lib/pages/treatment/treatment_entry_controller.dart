import 'dart:async';
import 'dart:convert';

import 'package:fish/pages/treatment/carbon_type_controller.dart';
import 'package:fish/service/treatment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'treatment_type_controller.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

class TreatmentEntryController extends GetxController {
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;
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
  TextEditingController descController = TextEditingController(text: '');
  // MaterialController materialController = MaterialController();
  // ShapeController shapeController = ShapeController();
  TypeController typeController = TypeController();
  CarbonTypeController carbonTypeController = CarbonTypeController();
  TextEditingController carbonTypeNullController =
      TextEditingController(text: '');
  TextEditingController waterController = TextEditingController(text: '0');
  TextEditingController saltController = TextEditingController(text: '0');
  TextEditingController probioticController = TextEditingController(text: '0');
  TextEditingController carbonController = TextEditingController(text: '0');
  TextEditingController nilaMerahWeightController =
      TextEditingController(text: '');

  TextEditingController nilaHitamWeightController =
      TextEditingController(text: '');
  TextEditingController leleWeightController = TextEditingController(text: '');

  TextEditingController patinWeightController = TextEditingController(text: '');
  TextEditingController masWeightController = TextEditingController(text: '');
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];

  Future<void> postFishGrading(BuildContext context, Function doInPost) async {
    bool value = await TreatmentService().postPondTreatment(
        pondId: pond.id,
        salt: saltController.value.text,
        type: typeController.selected.value,
        probiotic: probioticController.value.text,
        desc: descController.value.text,
        water: waterController.value.text,
        carbohydrate: carbonController.value.text,
        carbohydrate_type: carbonTypeController.selected.value == "tidak ada"
            ? carbonTypeNullController.value.text
            : carbonTypeController.selected.value);
    print(value);
    doInPost();
  }

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

  Future<void> postTreatmentBerat(
      BuildContext context, Function doInPost) async {
    bool value = await TreatmentService().postPondTreatmentBerat(
        pondId: pond.id,
        type: typeController.selected.value,
        desc: descController.value.text,
        total_fish_harvested: leleAmount.toInt() +
            patinAmount.toInt() +
            masAmount.toInt() +
            nilahitamAmount.toInt() +
            nilamerahAmount.toInt(),
        total_weight_harvested: getWeight(),
        isFinish: true,
        fish_harvested: buildJsonFish());
    print(value);
    doInPost();
  }
}

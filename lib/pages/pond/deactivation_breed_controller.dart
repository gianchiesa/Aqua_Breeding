import 'dart:convert';
import 'dart:ffi';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fish_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/service/activation_service.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeactivationBreedController extends GetxController {
  Pond pond = Get.arguments['pond'];
  // Activation activation = Get.arguments["activation"][0];
  ActivationService service = ActivationService();

  // Activation activation = Get.arguments["activation"];
  // Future<List<Activation>> activationsData =
  //       ActivationService().getActivations(pondId: pond.id!);
  // TextEditingController waterHeightController = TextEditingController(text: '');
  TextEditingController fishWeightController = TextEditingController(text: '');
  TextEditingController undersizeController = TextEditingController(text: '');
  TextEditingController oversizeController = TextEditingController(text: '');
  TextEditingController normalsizeController = TextEditingController(text: '');
  TextEditingController fishLengthAvgController =
      TextEditingController(text: '');
  TextEditingController sampleAmountController =
      TextEditingController(text: '');
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
      if (nilaMerahWeightController.value.text.contains(",")) {
        String nilaMerah =
            nilaMerahWeightController.value.text.replaceAll(',', '.');
        var fishData = {
          "type": "nila merah",
          "amount": nilamerahAmount.toString(),
          "weight": nilaMerah,
        };
        data.add(jsonEncode(fishData));
      } else {
        var fishData = {
          "type": "nila merah",
          "amount": nilamerahAmount.toString(),
          "weight": nilaMerahWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isNilaHitam.value == true) {
      if (nilaHitamWeightController.value.text.contains(",")) {
        String nilaHitam =
            nilaHitamWeightController.value.text.replaceAll(',', '.');
        var fishData = {
          "type": "nila hitam",
          "amount": nilahitamAmount.toString(),
          "weight": nilaHitam,
        };
        data.add(jsonEncode(fishData));
      } else {
        var fishData = {
          "type": "nila hitam",
          "amount": nilahitamAmount.toString(),
          "weight": nilaHitamWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isLele.value == true) {
      if (leleWeightController.value.text.contains(",")) {
        String lele = leleWeightController.value.text.replaceAll(',', '.');
        var fishData = {
          "type": "lele",
          "amount": leleAmount.toString(),
          "weight": lele,
        };
        data.add(jsonEncode(fishData));
      } else {
        var fishData = {
          "type": "lele",
          "amount": leleAmount.toString(),
          "weight": leleWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isPatin.value == true) {
      if (patinWeightController.value.text.contains(",")) {
        String patin = patinWeightController.value.text.replaceAll(',', '.');
        var fishData = {
          "type": "patin",
          "amount": patinAmount.toString(),
          "weight": patin,
        };
        data.add(jsonEncode(fishData));
      } else {
        var fishData = {
          "type": "patin",
          "amount": patinAmount.toString(),
          "weight": patinWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isMas.value == true) {
      if (masWeightController.value.text.contains(",")) {
        String mas = masWeightController.value.text.replaceAll(',', '.');
        var fishData = {
          "type": "mas",
          "amount": masAmount.toString(),
          "weight": mas,
        };
        data.add(jsonEncode(fishData));
      } else {
        var fishData = {
          "type": "mas",
          "amount": masAmount.toString(),
          "weight": masWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    return data;
  }

  double getWeight() {
    double weightTotal = 0;
    if (isNilaMerah.value == true) {
      if (nilaMerahWeightController.value.text.contains(',')) {
        String nilaMerah =
            nilaMerahWeightController.value.text.replaceAll(',', '.');

        weightTotal += double.parse(nilaMerah);
      } else {
        weightTotal += double.parse(nilaMerahWeightController.value.text);
      }
    }
    if (isNilaHitam.value == true) {
      if (nilaHitamWeightController.text != '') {
        if (nilaHitamWeightController.value.text.contains(',')) {
          String nilaHitam =
              nilaHitamWeightController.value.text.replaceAll(',', '.');

          weightTotal += double.parse(nilaHitam);
        } else {
          weightTotal += double.parse(nilaHitamWeightController.value.text);
        }
      }
    }
    if (isLele.value == true) {
      if (leleWeightController.value.text.contains(',')) {
        String lele = leleWeightController.value.text.replaceAll(',', '.');
        weightTotal += double.parse(lele);
      } else {
        weightTotal += double.parse(leleWeightController.value.text);
      }
    }
    if (isPatin.value == true) {
      if (patinWeightController.value.text.contains(',')) {
        String patin = patinWeightController.value.text.replaceAll(',', '.');
        weightTotal += double.parse(patin);
      } else {
        weightTotal += double.parse(patinWeightController.value.text);
      }
    }
    if (isMas.value == true) {
      if (masWeightController.value.text.contains(',')) {
        String mas = masWeightController.value.text.replaceAll(',', '.');

        weightTotal += double.parse(mas);
      } else {
        weightTotal += double.parse(masWeightController.value.text);
      }
    }
    return weightTotal;
  }

  Future<void> pondDeactivation(BuildContext context, Function doInPost) async {
    // prdouble(buildJsonFish());
    double weight = getWeight();
    if (weight == 0) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Input Error',
                    style: TextStyle(color: Colors.red)),
                content: const Text(
                  'Input Tidak boleh 0/Kosong',
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
    } else {
      isDeactivationProgress.value = true;
      try {
        await service.postDeactivation(
            pondId: pond.id,
            total_fish_harvested: leleAmount.toInt() +
                patinAmount.toInt() +
                masAmount.toInt() +
                nilahitamAmount.toInt() +
                nilamerahAmount.toInt(),
            total_weight_harvested: getWeight().toString(),
            isFinish: true,
            fish_harvested: buildJsonFish(),
            doInPost: doInPost,
            context: context);
        print(buildJsonFish());
      } catch (e) {
        //
      }
      isDeactivationProgress.value = false;
    }
  }

  late DateTime startTime;
  late DateTime endTime;
  final fitur = 'Deactivation';

  void onClose() {
    endTime = DateTime.now();
    super.onClose();
  }

  void onInit() {
    startTime = DateTime.now();
    super.onInit();
  }
}

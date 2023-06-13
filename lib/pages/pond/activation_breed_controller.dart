import 'dart:convert';
import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/detail_pond_page.dart';
import 'package:fish/models/pond_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/activation_service.dart';
import '../../service/logging_service.dart';
import '../../theme.dart';
import 'benih_option_controller.dart';
import 'breed_option_controller.dart';

class ActivationBreedController extends GetxController {
  Pond pond = Get.arguments['pond'];
  ActivationService service = ActivationService();
  BenihOptionController benihOptionController = BenihOptionController();
  BreedOptionController breedOptionController = BreedOptionController();
  TextEditingController waterHeightController = TextEditingController(text: '');
  TextEditingController kelasPembesaranController =
      TextEditingController(text: '');
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

  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;
  var isLele = false.obs;
  var isPatin = false.obs;
  var isMas = false.obs;
  var isActivationProgress = false.obs;
  var isPondActive = false.obs;
  var isZeroInput = true.obs;
  var isNoFist = true.obs;

  List activations = [];

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
    isNoFist.value = true;
    if (isNilaMerah.value == true) {
      if (nilaMerahAmountController.text == "0" ||
          nilaMerahWeightController.text == "0" ||
          nilaMerahAmountController.text == "" ||
          nilaMerahWeightController.text == "") {
        isNoFist.value = false;
      } else {
        var fishData = {
          "type": "nila merah",
          "amount": nilaMerahAmountController.value.text,
          "weight": nilaMerahWeightController.value.text,
        };
        isNoFist.value = false;
        isZeroInput.value = false;

        data.add(jsonEncode(fishData));
      }
    }
    if (isNilaHitam.value == true) {
      if (nilaHitamAmountController.text == "0" ||
          nilaHitamWeightController.text == "0" ||
          nilaHitamAmountController.text == "" ||
          nilaHitamWeightController.text == "") {
        isNoFist.value = false;
      } else {
        isNoFist.value = false;
        isZeroInput.value = false;

        var fishData = {
          "type": "nila hitam",
          "amount": nilaHitamAmountController.value.text,
          "weight": nilaHitamWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isLele.value == true) {
      if (leleAmountController.text == "0" ||
          leleWeightController.text == "0" ||
          leleAmountController.text == "" ||
          leleWeightController.text == "") {
        isNoFist.value = false;
      } else {
        isNoFist.value = false;
        isZeroInput.value = false;

        var fishData = {
          "type": "lele",
          "amount": leleAmountController.value.text,
          "weight": leleWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isPatin.value == true) {
      if (patinAmountController.text == "0" ||
          patinWeightController.text == "0" ||
          patinAmountController.text == "" ||
          patinWeightController.text == "") {
        isNoFist.value = false;
      } else {
        isNoFist.value = false;
        isZeroInput.value = false;

        var fishData = {
          "type": "patin",
          "amount": patinAmountController.value.text,
          "weight": patinWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    if (isMas.value == true) {
      if (masAmountController.text == "0" ||
          masWeightController.text == "0" ||
          masAmountController.text == "" ||
          masWeightController.text == "") {
        isNoFist.value = false;
      } else {
        isZeroInput.value = false;

        var fishData = {
          "type": "mas",
          "amount": masAmountController.value.text,
          "weight": masWeightController.value.text,
        };
        data.add(jsonEncode(fishData));
      }
    }
    return data;
  }

  Future<void> pondActivation(BuildContext context, Function doInPost) async {
    // print(buildJsonFish());

    List<dynamic> fish = buildJsonFish();
    if (isNoFist.value == true) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Input Error',
                    style: TextStyle(color: Colors.red)),
                content: const Text(
                  'Wajib Pilih Salah 1 Ikan',
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
      if (isZeroInput.value == true ||
          waterHeightController.value.text == '' ||
          waterHeightController.value.text == '0') {
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
        print("masuk ini");
        isActivationProgress.value = true;

        try {
          await service.postActivation(
              pondId: pond.id,
              fish: fish,
              isWaterPreparation: false,
              waterLevel: waterHeightController.value.text,
              doInPost: doInPost);
          postDataLog(fitur);
        } catch (e) {
          //
        }
        isActivationProgress.value = false;
      }
    }
    // // Get.to(() => DetailPondPage(),
    // //     arguments: Pond(
    // //         id: pond.id,
    // //         idInt: pond.idInt,
    // //         alias: pond.alias,
    // //         location: pond.location,
    // //         shape: pond.shape,
    // //         material: pond.material,
    // //         isActive: true,
    // //         pondStatus: PondStatus.active));
  }

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Activation';
}

import 'dart:convert';
import 'dart:developer';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/breed_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/activation_service.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddFishController extends GetxController {
  final ActivationService service = ActivationService();
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  final BreedController breedController = Get.find();

  final isNilaMerah = false.obs;
  final isNilaHitam = false.obs;
  final isLele = false.obs;
  final isPatin = false.obs;
  final isMas = false.obs;

  final TextEditingController nilaMerahAmountController =
      TextEditingController(text: '');
  final TextEditingController nilaMerahWeightController =
      TextEditingController(text: '');
  final TextEditingController nilaHitamAmountController =
      TextEditingController(text: '');
  final TextEditingController nilaHitamWeightController =
      TextEditingController(text: '');
  final TextEditingController leleAmountController =
      TextEditingController(text: '');
  final TextEditingController leleWeightController =
      TextEditingController(text: '');
  final TextEditingController patinAmountController =
      TextEditingController(text: '');
  final TextEditingController patinWeightController =
      TextEditingController(text: '');
  final TextEditingController masAmountController =
      TextEditingController(text: '');
  final TextEditingController masWeightController =
      TextEditingController(text: '');

  final isNoFist = true.obs;
  final isZeroInput = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

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

  Future<void> addFish(BuildContext context, Function doInPost) async {
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
      if (isZeroInput.value == true) {
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
        try {
          await service.postAddFishInActivation(
              pondId: pondController.selectedPond.value.id,
              fish: fish,
              doInPost: doInPost);
        } catch (e) {
          //
        }
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
}

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
import 'benih_option_controller.dart';
import 'breed_option_controller.dart';

class ActivationBreedController extends GetxController {
  Pond pond = Get.arguments['pond'];
  ActivationService service = ActivationService();
  BenihOptionController benihOptionController = BenihOptionController();
  TextEditingController waterHeightController =
      TextEditingController(text: '0');
  BreedOptionController breedOptionController = BreedOptionController();
  TextEditingController kelasPembesaranController =
      TextEditingController(text: '');

  TextEditingController nilaMerahAmountController =
      TextEditingController(text: '0');
  TextEditingController nilaMerahWeightController =
      TextEditingController(text: '0');
  TextEditingController nilaHitamAmountController =
      TextEditingController(text: '0');
  TextEditingController nilaHitamWeightController =
      TextEditingController(text: '0');
  TextEditingController leleAmountController = TextEditingController(text: '0');
  TextEditingController leleWeightController = TextEditingController(text: '0');
  TextEditingController patinAmountController =
      TextEditingController(text: '0');
  TextEditingController patinWeightController =
      TextEditingController(text: '0');
  TextEditingController masAmountController = TextEditingController(text: '0');
  TextEditingController masWeightController = TextEditingController(text: '0');

  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;
  var isLele = false.obs;
  var isPatin = false.obs;
  var isMas = false.obs;
  var isActivationProgress = false.obs;

  // List activations = [];

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

  double getAvgWeight() {
    switch (benihOptionController.selected.value) {
      case "1-2 cm":
        return 0.5;
      case "2-3 cm":
        return 1;
      case "3-4 cm":
        return 1.5;
      case "4-5 cm":
        return 2;
      case "5-6 cm":
        return 2.5;
      case "6-7 cm":
        return 2.7;
      case "7-8 cm":
        return 3;
      case "8-9 cm":
        return 3.2;
      case "9-10 cm":
        return 3.5;
      case "10-11 cm":
        return 4;
      case "11-12 cm":
        return 5;
      case "12-13 cm":
        return 5.5;
      default:
        return 0;
    }
  }

  Map<String, dynamic> validationInput() {
    Map<String, dynamic> result = {
      'isValid': false,
      'message': '',
    };

    if (isNilaHitam.value == false &&
        isNilaMerah == false &&
        isLele == false &&
        isPatin == false &&
        isMas == false) {
      result['isValid'] = false;
      result['message'] = "Tidak ada jenis ikan yang dipilih";
      return result;
    }

    if (isNilaHitam.value == true) {
      if (nilaHitamAmountController.text.isEmpty ||
          int.parse(nilaHitamAmountController.text) < 1) {
        result['isValid'] = false;
        result['message'] = "Jumlah ikan nila hitam harus harus lebih dari 0";
        return result;
      }
      if (nilaHitamWeightController.text.isEmpty ||
          double.parse(nilaHitamWeightController.text) <= 0) {
        result['isValid'] = false;
        result['message'] = "Berat ikan nila hitam harus harus lebih dari 0";
        return result;
      }
    }

    if (isNilaMerah.value == true) {
      if (nilaMerahAmountController.text.isEmpty ||
          int.parse(nilaMerahAmountController.text) < 1) {
        result['isValid'] = false;
        result['message'] = "Jumlah ikan nila merah harus harus lebih dari 0";
        return result;
      }
      if (nilaMerahWeightController.text.isEmpty ||
          double.parse(nilaMerahWeightController.text) <= 0) {
        result['isValid'] = false;
        result['message'] = "Berat ikan nila merah harus harus lebih dari 0";
        return result;
      }
    }

    if (isLele.value == true) {
      if (leleAmountController.text.isEmpty ||
          int.parse(leleAmountController.text) < 1) {
        result['isValid'] = false;
        result['message'] = "Jumlah ikan lele harus harus lebih dari 0";
        return result;
      }
      if (leleWeightController.text.isEmpty ||
          double.parse(leleWeightController.text) <= 0) {
        result['isValid'] = false;
        result['message'] = "Berat ikan lele harus harus lebih dari 0";
        return result;
      }
    }

    if (isPatin.value == true) {
      if (patinAmountController.text.isEmpty ||
          int.parse(patinAmountController.text) < 1) {
        result['isValid'] = false;
        result['message'] = "Jumlah ikan patin harus harus lebih dari 0";
        return result;
      }
      if (patinWeightController.text.isEmpty ||
          double.parse(patinWeightController.text) <= 0) {
        result['isValid'] = false;
        result['message'] = "Berat ikan patin harus harus lebih dari 0";
        return result;
      }
    }

    if (isMas.value == true) {
      if (masAmountController.text.isEmpty ||
          int.parse(masAmountController.text) < 1) {
        result['isValid'] = false;
        result['message'] = "Jumlah ikan mas harus harus lebih dari 0";
        return result;
      }
      if (masWeightController.text.isEmpty ||
          double.parse(masWeightController.text) <= 0) {
        result['isValid'] = false;
        result['message'] = "Berat ikan mas harus harus lebih dari 0";
        return result;
      }
    }

    if (double.parse((waterHeightController.text)) == 0) {
      result['isValid'] = false;
      result['message'] = "Tinggi air harus lebih dari 0";
      return result;
    }
    print('sampai validation sini');

    result['isValid'] = true;
    result['message'] = "Isian sudah benar";
    return result;
  }

  List buildJsonFish() {
    var data = [];
    if (isNilaMerah.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": int.parse(nilaMerahAmountController.value.text),
        "weight": double.parse(nilaMerahWeightController.text) /
            int.parse(nilaMerahAmountController.value.text),
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitam.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": int.parse(nilaHitamAmountController.value.text),
        "weight": double.parse(nilaHitamWeightController.text) /
            int.parse(nilaHitamAmountController.value.text),
      };
      data.add(jsonEncode(fishData));
    }
    if (isLele.value == true) {
      var fishData = {
        "type": "lele",
        "amount": int.parse(leleAmountController.value.text),
        "weight": double.parse(leleWeightController.text) /
            int.parse(leleAmountController.value.text),
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatin.value == true) {
      var fishData = {
        "type": "patin",
        "amount": int.parse(patinAmountController.value.text),
        "weight": double.parse(patinWeightController.text) /
            int.parse(patinAmountController.value.text),
      };
      data.add(jsonEncode(fishData));
    }
    if (isMas.value == true) {
      var fishData = {
        "type": "mas",
        "amount": int.parse(masAmountController.value.text),
        "weight": double.parse(masWeightController.text) /
            int.parse(masAmountController.value.text),
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

  Future<void> pondActivation(BuildContext context, Function doInPost) async {
    // print(buildJsonFish());

    List<dynamic> fish = buildJsonFish();
    try {
      await service.postActivation(
          pondId: pond.id,
          fish: fish,
          activationType: breedOptionController.selected.value,
          benihType: benihOptionController.selected.value,
          isWaterPreparation: false,
          waterLevel: waterHeightController.value.text,
          doInPost: doInPost);
      postDataLog(fitur);
    } catch (e) {
      //
    }
    isActivationProgress.value = false;
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

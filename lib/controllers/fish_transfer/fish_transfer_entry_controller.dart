import 'dart:async';
import 'dart:convert';

import 'package:fish/pages/treatment/carbon_type_controller.dart';
import 'package:fish/service/fish_transfer_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/pond_service.dart';
import 'pond_list_item_controller.dart';
import 'transfer_method_controller.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

class FishTransferEntryController extends GetxController {
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;
  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;
  var isLele = false.obs;
  var isPatin = false.obs;
  var isMas = false.obs;
  var destinationIsActive = false.obs;
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

  var isNilaMerahInput = false.obs;
  var isNilaHitamInput = false.obs;
  var isLeleInput = false.obs;
  var isPatinInput = false.obs;
  var isMasInput = false.obs;

  // var aktivasi
  var isNilaMerahActivation = false.obs;
  var isNilaHitamActivation = false.obs;
  var isLeleActivation = false.obs;
  var isPatinActivation = false.obs;
  var isMasActivation = false.obs;
  TextEditingController descController = TextEditingController(text: '');
//input transfer
  PondListController pondlistController = PondListController();
  TransferMethodController methodController = TransferMethodController();
  TextEditingController sampleWeightController =
      TextEditingController(text: '0');

  TextEditingController sampleLongController = TextEditingController(text: '0');
  TextEditingController nilaMerahAmountController =
      TextEditingController(text: '');

  TextEditingController nilaHitamAmountController =
      TextEditingController(text: '');
  TextEditingController leleAmountController = TextEditingController(text: '');

  TextEditingController patinAmountController = TextEditingController(text: '');
  TextEditingController masAmountController = TextEditingController(text: '');

  TextEditingController nilaMerahWeightController =
      TextEditingController(text: '');

  TextEditingController nilaHitamWeightController =
      TextEditingController(text: '');
  TextEditingController leleWeightController = TextEditingController(text: '');

  TextEditingController patinWeightController = TextEditingController(text: '');
  TextEditingController masWeightController = TextEditingController(text: '');
  //input aktifasi
  TextEditingController nilaMerahWeightActivationController =
      TextEditingController(text: '');

  TextEditingController nilaHitamWeightActivationController =
      TextEditingController(text: '');
  TextEditingController leleWeightActivationController =
      TextEditingController(text: '');

  TextEditingController patinWeightActivationController =
      TextEditingController(text: '');
  TextEditingController masWeightActivationController =
      TextEditingController(text: '');
  TextEditingController nilaMerahAmountActivationController =
      TextEditingController(text: '');

  TextEditingController nilaHitamAmountActivationController =
      TextEditingController(text: '');
  TextEditingController leleAmountActivationController =
      TextEditingController(text: '');

  TextEditingController patinAmountActivationController =
      TextEditingController(text: '');
  TextEditingController masAmountActivationController =
      TextEditingController(text: '');
  TextEditingController waterHeightController =
      TextEditingController(text: '0');

  //input deaktifasi
  TextEditingController nilaMerahWeightDeactivationController =
      TextEditingController(text: '');

  TextEditingController nilaHitamWeightDeactivationController =
      TextEditingController(text: '');
  TextEditingController leleWeightDeactivationController =
      TextEditingController(text: '');

  TextEditingController patinWeightDeactivationController =
      TextEditingController(text: '');
  TextEditingController masWeightDeactivationController =
      TextEditingController(text: '');
  TextEditingController nilaMerahAmountDeactivationController =
      TextEditingController(text: '');

  TextEditingController nilaHitamAmountDeactivationController =
      TextEditingController(text: '');
  TextEditingController leleAmountDeactivationController =
      TextEditingController(text: '');

  TextEditingController patinAmountDeactivationController =
      TextEditingController(text: '');
  TextEditingController masAmountDeactivationController =
      TextEditingController(text: '');
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  // final listPondName = [].obs;
  RxList<String> listPondName = List<String>.empty().obs;
  final pondSelected = <Pond>[].obs;
  var pondIdSelected = "";

  Future<void> getPondsData(String method) async {
    isLoading.value = true;
    List<Pond> pondsData = await PondService().getPonds();
    listPondName.clear();
    if (method == "kering") {
      listPondName.add("pilih kolam");
      for (var i in pondsData) {
        listPondName.add(i.alias.toString());
      }
    } else {
      listPondName.add("pilih kolam");
      for (var i in pondsData) {
        if (i.isActive == true) {
          listPondName.add(i.alias.toString());
        }
      }
    }
    isLoading.value = false;
  }

  Future<void> getDestinationId(String alias) async {
    isLoading.value = true;
    List<Pond> pondsData = await PondService().getPonds();
    pondSelected.clear();
    for (var i in pondsData) {
      if (i.alias == alias) {
        pondSelected.add(i);
        destinationIsActive.value = i.isActive!;
        pondIdSelected = i.id.toString();
      }
    }
    print(pondIdSelected);
    print(pondSelected);
    isLoading.value = false;
  }

  Future<void> postFishTransferBasah(
      BuildContext context, Function doInPost) async {
    double sampleweight = int.parse(sampleWeightController.value.text) / 1000;
    bool value = await FishTransferService().postFishTransfer(
        origin_pond_id: pond.id,
        destination_pond_id: pondIdSelected,
        transfer_method: methodController.selected.value,
        transfer_type: "oversized_transfer",
        sample_long: sampleLongController.value.text,
        sample_weight: sampleweight.toString(),
        fish: buildJsonFish());
    print(value);
    doInPost();
  }

  Future<void> getHarvestedBool(Activation activation) async {
    for (var i in activation.fishLive!) {
      if (i.type == 'lele') {
        isLele.value = true;
      }
      if (i.type == 'patin') {
        isPatin.value = true;
      }
      if (i.type == 'mas') {
        isMas.value = true;
      }
      if (i.type == 'nila hitam') {
        isNilaHitam.value = true;
      }
      if (i.type == 'nila merah') {
        isNilaMerah.value = true;
      }
    }
  }

  void setInputLele(bool value) {
    isLeleInput.value = value;
  }

  void setInputNilaMerah(bool value) {
    isNilaMerahInput.value = value;
  }

  void setInputNilaHitam(bool value) {
    isNilaHitamInput.value = value;
  }

  void setInputPatin(bool value) {
    isPatinInput.value = value;
  }

  void setInputMas(bool value) {
    isMasInput.value = value;
  }

  List buildJsonFish() {
    var data = [];
    if (isNilaMerahInput.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": nilaMerahAmountController.value.text,
        "weight": nilaMerahWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitamInput.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": nilaHitamAmountController.value.text,
        "weight": nilaHitamWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isLeleInput.value == true) {
      var fishData = {
        "type": "lele",
        "amount": leleAmountController.value.text,
        "weight": leleWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatinInput.value == true) {
      var fishData = {
        "type": "patin",
        "amount": patinAmountController.value.text,
        "weight": patinWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isMasInput.value == true) {
      var fishData = {
        "type": "mas",
        "amount": masAmountController.value.text,
        "weight": masWeightController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

//function aktifasi
  void setLele(bool value) {
    isLeleActivation.value = value;
  }

  void setNilaMerah(bool value) {
    isNilaMerahActivation.value = value;
  }

  void setNilaHitam(bool value) {
    isNilaHitamActivation.value = value;
  }

  void setPatin(bool value) {
    isPatinActivation.value = value;
  }

  void setMas(bool value) {
    isMasActivation.value = value;
  }

  List buildJsonFishActivation() {
    var data = [];
    if (isNilaMerahActivation.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": nilaMerahAmountActivationController.value.text,
        "weight": nilaMerahAmountActivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitamActivation.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": nilaHitamAmountActivationController.value.text,
        "weight": nilaHitamWeightActivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isLeleActivation.value == true) {
      var fishData = {
        "type": "lele",
        "amount": leleAmountActivationController.value.text,
        "weight": leleWeightActivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatinActivation.value == true) {
      var fishData = {
        "type": "patin",
        "amount": patinAmountActivationController.value.text,
        "weight": patinWeightActivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isMasActivation.value == true) {
      var fishData = {
        "type": "mas",
        "amount": masAmountActivationController.value.text,
        "weight": masWeightActivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

  //funtion deactivation
  List buildJsonFishDeactivation() {
    var data = [];
    if (isNilaMerah.value == true) {
      var fishData = {
        "type": "nila merah",
        "amount": nilaMerahAmountDeactivationController.value.text,
        "weight": nilaMerahAmountDeactivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isNilaHitam.value == true) {
      var fishData = {
        "type": "nila hitam",
        "amount": nilaHitamAmountDeactivationController.value.text,
        "weight": nilaHitamWeightDeactivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isLele.value == true) {
      var fishData = {
        "type": "lele",
        "amount": leleAmountDeactivationController.value.text,
        "weight": leleWeightDeactivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isPatin.value == true) {
      var fishData = {
        "type": "patin",
        "amount": patinAmountDeactivationController.value.text,
        "weight": patinWeightDeactivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    if (isMas.value == true) {
      var fishData = {
        "type": "mas",
        "amount": masAmountDeactivationController.value.text,
        "weight": masWeightDeactivationController.value.text,
      };
      data.add(jsonEncode(fishData));
    }
    return data;
  }

  int getWeightDeactivation() {
    int weightTotal = 0;
    if (isNilaMerah.value == true) {
      weightTotal +=
          int.parse(nilaMerahWeightDeactivationController.value.text);
    }
    if (isNilaHitam.value == true) {
      weightTotal +=
          int.parse(nilaHitamWeightDeactivationController.value.text);
    }
    if (isLele.value == true) {
      weightTotal += int.parse(leleWeightDeactivationController.value.text);
    }
    if (isPatin.value == true) {
      weightTotal += int.parse(patinWeightDeactivationController.value.text);
    }
    if (isMas.value == true) {
      weightTotal += int.parse(masWeightDeactivationController.value.text);
    }
    return weightTotal;
  }

  int getAmountDeactivation() {
    int amountTotal = 0;
    if (isNilaMerah.value == true) {
      amountTotal +=
          int.parse(nilaMerahAmountDeactivationController.value.text);
    }
    if (isNilaHitam.value == true) {
      amountTotal +=
          int.parse(nilaHitamAmountDeactivationController.value.text);
    }
    if (isLele.value == true) {
      amountTotal += int.parse(leleAmountDeactivationController.value.text);
    }
    if (isPatin.value == true) {
      amountTotal += int.parse(patinAmountDeactivationController.value.text);
    }
    if (isMas.value == true) {
      amountTotal += int.parse(masAmountDeactivationController.value.text);
    }
    return amountTotal;
  }

  Future<void> postSortirKering(BuildContext context, Function doInPost) async {
    double sampleweight = int.parse(sampleWeightController.value.text) / 1000;
    bool value = await FishTransferService().postFishTransferKering(
        origin_pond_id: pond.id,
        destination_pond_id: pondIdSelected,
        transfer_method: methodController.selected.value,
        transfer_type: "oversized_transfer",
        sample_long: sampleLongController.value.text,
        sample_weight: sampleweight.toString(),
        total_fish_harvested: leleAmount.toInt() +
            patinAmount.toInt() +
            masAmount.toInt() +
            nilahitamAmount.toInt() +
            nilamerahAmount.toInt(),
        total_weight_harvested: getWeightDeactivation(),
        fish: buildJsonFish(),
        fishstock: buildJsonFishActivation(),
        fishharvested: buildJsonFishDeactivation(),
        water_level: waterHeightController.value.text);
    print(value);
    doInPost();
  }

  final sampleLong = ''.obs;
  final validatesampleLong = false.obs;
  void sampleLongChanged(String val) {
    sampleLong.value = val;
  }

  void valsampleLong() {
    validatesampleLong.value = true;
  }

  final sampleWeight = ''.obs;
  final validatesampleWeight = false.obs;
  void sampleWeightChanged(String val) {
    sampleWeight.value = val;
  }

  void valsampleWeight() {
    validatesampleWeight.value = true;
  }

  final leleAmountval = ''.obs;
  final validateleleAmountval = false.obs;
  void leleAmountvalChanged(String val) {
    leleAmountval.value = val;
  }

  void valleleAmountval() {
    validateleleAmountval.value = true;
  }

  final leleWeightval = ''.obs;
  final validateleleWeightval = false.obs;
  void leleWeightvalChanged(String val) {
    leleWeightval.value = val;
  }

  void valleleWeightval() {
    validateleleWeightval.value = true;
  }

  final nilaMerahAmountval = ''.obs;
  final validatenilaMerahAmountval = false.obs;
  void nilaMerahAmountvalChanged(String val) {
    nilaMerahAmountval.value = val;
  }

  void valnilaMerahAmountval() {
    validatenilaMerahAmountval.value = true;
  }

  final nilaMerahWeightval = ''.obs;
  final validatenilaMerahWeightval = false.obs;
  void nilaMerahWeightvalChanged(String val) {
    nilaMerahWeightval.value = val;
  }

  void valnilaMerahWeightval() {
    validatenilaMerahWeightval.value = true;
  }

  final nilaHitamAmountval = ''.obs;
  final validatenilaHitamAmountval = false.obs;
  void nilaHitamAmountvalChanged(String val) {
    nilaHitamAmountval.value = val;
  }

  void valnilaHitamAmountval() {
    validatenilaHitamAmountval.value = true;
  }

  final nilaHitamWeightval = ''.obs;
  final validatenilaHitamWeightval = false.obs;
  void nilaHitamWeightvalChanged(String val) {
    nilaHitamWeightval.value = val;
  }

  void valnilaHitamWeightval() {
    validatenilaHitamWeightval.value = true;
  }

  final masAmountval = ''.obs;
  final validatemasAmountval = false.obs;
  void masAmountvalChanged(String val) {
    masAmountval.value = val;
  }

  void valmasAmountval() {
    validatemasAmountval.value = true;
  }

  final masWeightval = ''.obs;
  final validatemasWeightval = false.obs;
  void masWeightvalChanged(String val) {
    masWeightval.value = val;
  }

  void valmasWeightval() {
    validatemasWeightval.value = true;
  }

  final patinAmountval = ''.obs;
  final validatepatinAmountval = false.obs;
  void patinAmountvalChanged(String val) {
    patinAmountval.value = val;
  }

  void valpatinAmountval() {
    validatepatinAmountval.value = true;
  }

  final patinWeightval = ''.obs;
  final validatepatinWeightval = false.obs;
  void patinWeightvalChanged(String val) {
    patinWeightval.value = val;
  }

  void valpatinWeightval() {
    validatepatinWeightval.value = true;
  }
}

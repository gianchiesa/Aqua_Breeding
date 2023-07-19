import 'dart:convert';
import 'dart:developer';

import 'package:fish/models/fish_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/breed_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/activation_service.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditFishController extends GetxController {
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
  final TextEditingController nilaHitamAmountController =
      TextEditingController(text: '');
  final TextEditingController leleAmountController =
      TextEditingController(text: '');
  final TextEditingController patinAmountController =
      TextEditingController(text: '');
  final TextEditingController masAmountController =
      TextEditingController(text: '');

  // final isEdit = false.obs;

  @override
  void onInit() {
    setDefaultValueTextController();
    super.onInit();
  }

  void setDefaultValueTextController() {
    List<Fish> list_fishLive =
        detailPondController.selectedActivation.value.fishLive!;
    for (Fish fish in list_fishLive) {
      TextEditingController textController = getTextController(fish.type!);
      textController.text = fish.amount.toString();
    }
  }

  getTextController(String fishName) {
    switch (fishName) {
      case "nila merah":
        return nilaMerahAmountController;
      case "nila hitam":
        return nilaHitamAmountController;
      case "lele":
        return leleAmountController;
      case "patin":
        return patinAmountController;
      case "mas":
        return masAmountController;
    }
  }

  List? buildJsonFish() {
    var data = [];
    List<Fish> list_fishLive =
        detailPondController.selectedActivation.value.fishLive!;
    for (Fish fish in list_fishLive) {
      TextEditingController textController = getTextController(fish.type!);
      int amount =
          int.parse(textController.text) - int.parse(fish.amount.toString());
      var fishData = {
        "type": fish.type,
        "amount": amount,
      };
      if (amount != 0) {
        data.add(jsonEncode(fishData));
      }
    }
    return data;
  }

  static bool isEdit() {
    final DetailPondController detailPondController = Get.find();
    final EditFishController editFishController = Get.find();
    List<Fish> list_fishLive =
        detailPondController.selectedActivation.value.fishLive!;
    for (Fish fish in list_fishLive) {
      TextEditingController textController =
          editFishController.getTextController(fish.type!);
      if (int.parse(textController.text) != int.parse(fish.amount.toString())) {
        return true;
      }
    }
    return false;
  }

  Future<void> editFish(BuildContext context, Function doInPost) async {
    List<dynamic> fish = buildJsonFish()!;
    inspect(fish);
    try {
      await service.postEditFishInActivation(
          pondId: pondController.selectedPond.value.id,
          fish: fish,
          doInPost: doInPost);
      await detailPondController.updateListAndSelectedActivation();
    } catch (e) {
      print(e);
    }
  }
}

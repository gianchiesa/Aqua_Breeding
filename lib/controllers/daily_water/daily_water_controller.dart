import 'dart:async';
import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/daily_water_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../service/logging_service.dart';

class DailyWaterController extends GetxController {
  final PondController pondController = Get.find();
  final DailyWaterBreedListController dailyWaterBreedListController =
      Get.find();
  // Activation activation = Get.arguments["activation"];
  // Pond pond = Get.arguments["pond"];
  var isLoading = false.obs;
  final listDailyWater = <DailyWater>[].obs;
  late Rx<DailyWater> selectedDailyWater;
  final listDailyWaterAvg = <DailyWater>[].obs;
  List sol = [].obs;

  // @override
  // void onReady() async {
  //   await getStatisticData();
  //   super.onReady();
  // }

  // Future<void> getTreatmentData() async {
  //   isLoading.value = true;
  //   listTreatment.clear();
  //   Treatment feedHistoryMonthly = await TreatmentService().getTreatmentList();
  //   listTreatment.addAll(feedHistoryMonthly);
  //   isLoading.value = false;
  // }

  Future<void> getDailyWaterData(BuildContext context) async {
    isLoading.value = true;
    listDailyWater.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService().getPonds();
    for (var i in dailyWaterData) {
      if (i.activationId ==
          dailyWaterBreedListController.selectedActivation.value.id) {
        listDailyWater.add(i);
      }
    }
    // print(listTreatment.value);
    isLoading.value = false;
  }

  Future<void> getDailyWaterData2() async {
    isLoading.value = true;
    listDailyWater.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService().getPonds();
    for (var i in dailyWaterData) {
      if (i.activationId ==
          dailyWaterBreedListController.selectedActivation.value.id) {
        listDailyWater.add(i);
      }
    }
    // print(listTreatment.value);

    isLoading.value = false;
  }

  Future<void> getDailyWaterDataAvg(BuildContext context) async {
    isLoading.value = true;
    listDailyWater.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService().getPonds();
    for (var i in dailyWaterData) {
      if (i.activationId ==
          dailyWaterBreedListController.selectedActivation.value.id) {
        listDailyWater.add(i);
      }
    }
    print('data berubab');
    // print(listTreatment.value);
    isLoading.value = false;
  }

  void updateSelectedDailyWater(dailyWaterId) {
    try {
      selectedDailyWater.value = listDailyWater
          .firstWhere((dailyWater) => dailyWater.id == dailyWaterId);
    } catch (e) {
      selectedDailyWater = Rx<DailyWater>(listDailyWater
          .firstWhere((dailyWater) => dailyWater.id == dailyWaterId));
    }
  }

  Future<void> updateListAndSelectedDailyWater() async {
    await getDailyWaterData2();
    selectedDailyWater.value = listDailyWater.firstWhere(
        (dailyWater) => dailyWater.id == selectedDailyWater.value.id);
  }

  final fitur = 'Daily Water Quality';
  late DateTime startTime;
  late DateTime endTime;
  @override
  void onClose() {
    endTime = DateTime.now();
    update();
    postDataLog(fitur);
    super.onClose();
  }

  @override
  void onInit() {
    print("ini init state water");
    // getDailyWaterData2();
    // print('ini on init dailywater');
    super.onInit();
  }

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }
}
// class TreatmentList {
//   TreatmentList(this.id, this.date, this.type);
//   final String id;
//   final String date;
//   final String type;
// }

import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/weekly_water_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WeeklyWaterController extends GetxController {
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  var isLoading = false.obs;
  final listWeeklyWater = <WeeklyWater>[].obs;

  Future<void> getWeeklyWaterData(BuildContext context) async {
    isLoading.value = true;
    listWeeklyWater.clear();
    List<WeeklyWater> weeklyWaterData = await WeeklyWaterService().getDatas();
    for (var i in weeklyWaterData) {
      if (i.activationId == activation.id) {
        print('Weekly Water get test');
        listWeeklyWater.add(i);
      }
    }
    print(listWeeklyWater);
    // formattedList(listWeeklyWater);
    // print(listTreatment.value);
    isLoading.value = false;
  }
}

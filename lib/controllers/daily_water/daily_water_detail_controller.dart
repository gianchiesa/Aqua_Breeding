// ignore_for_file: use_build_context_synchronously

import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/daily_water_service.dart';
import '../../service/logging_service.dart';

class DailyWaterDetailController extends GetxController {
  var isLoading = false.obs;
  DailyWater dailyWater = Get.arguments["dailywater"];
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final dailyWaterfix = <DailyWater>[].obs;

  Future<void> getDailyWaterData(
      BuildContext context, String dailywaterId) async {
    isLoading.value = true;
    dailyWaterfix.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService()
        .getDatas(dailywaterId: dailyWater.id.toString());
    dailyWaterfix.addAll(dailyWaterData);
    // print(listTreatment.value);
    isLoading.value = false;
  }

  Future<void> deleteDailyWaterData(
      BuildContext context, String dailywaterId) async {
    isLoading.value = true;

    await DailyWaterService().DeleteDatas(dailywaterId: dailywaterId);
    Navigator.pop(context);

    // print(listTreatment.value);
    isLoading.value = false;
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Daily Water Quality';

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }
  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

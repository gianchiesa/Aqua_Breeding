import 'dart:async';
import 'package:fish/service/weekly_water_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

import '../../service/logging_service.dart';

class WeeklyWaterEntryController extends GetxController {
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;

  // MaterialController materialController = MaterialController();
  // ShapeController shapeController = ShapeController();

  TextEditingController flocController = TextEditingController(text: '0');
  TextEditingController nitriteController = TextEditingController(text: '0');

  TextEditingController nitrateController = TextEditingController(text: '0');

  TextEditingController amoniaController = TextEditingController(text: '0');

  TextEditingController hardnessController = TextEditingController(text: '0');
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];

  getWeek() {
    var week = (DateTime.now().day - activation.activationAt!.day) / 7;
    return week.ceil();
  }

  Future<void> postWeeklyWaterData(
      BuildContext context, Function doInPost) async {
    bool value = await WeeklyWaterService().postWeeklyWater(
        pondId: pond.id,
        activationId: activation.id,
        floc: flocController.value.text,
        nitrate: nitrateController.value.text == ''
            ? 0.toString()
            : nitrateController.value.text,
        nitrite: nitriteController.value.text == ''
            ? 0.toString()
            : nitriteController.value.text,
        ammonia: amoniaController.value.text == ''
            ? 0.toString()
            : amoniaController.value.text,
        hardness: hardnessController.value.text == ''
            ? 0.toString()
            : hardnessController.value.text,
        week: getWeek().toString());
    print(value);
    doInPost();
  }
  // @override
  // void onInit() async {
  //   await getPondsData();
  //   super.onInit();
  // }

  // Future<void> getPondsData() async {
  //   isLoading.value = true;
  //   ponds.clear();
  //   List<Pond> pondsData = await PondService().getPonds();
  //   ponds.addAll(pondsData);

  //   isLoading.value = false;
  // }

  // Future<void> pondRegister() async {
  //   bool value = await PondService().pondRegister(
  //       alias: aliasController.text,
  //       location: locationController.text,
  //       shape: shapeController.selected.value,
  //       material: materialController.selected.value,
  //       length: lengthController.text,
  //       width: widthController.text,
  //       diameter: diameterController.text,
  //       height: heightController.text);
  //   print(value);
  //   await getPondsData();
  //   Get.to(() => DashboardPage());
  // }
  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Weekly Water Quality';

  @override
  void dispose() {
    flocController.clear();
    hardnessController.clear();
    amoniaController.clear();
    nitrateController.clear();
    nitriteController.clear();
    postDataLog(fitur);
    super.dispose();
  }

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }
}

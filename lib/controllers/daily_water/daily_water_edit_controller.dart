import 'dart:async';
import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/daily_water_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';
import 'package:http/http.dart';

class DailyWaterEditController extends GetxController {
  final PondController pondController = Get.find();
  final DailyWaterBreedListController dailyWaterBreedListController =
      Get.find();
  final DailyWaterController dailyWaterController = Get.find();
  // Pond pond = Get.arguments["pond"];
  // Activation activation = Get.arguments["activation"];
  // DailyWater dailyWater = Get.arguments["dailywater"];
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;

  TextEditingController descController = TextEditingController(text: '');
  // MaterialController materialController = MaterialController();
  // ShapeController shapeController = ShapeController();

  TextEditingController temperatureController =
      TextEditingController(text: '0');
  TextEditingController phController = TextEditingController(text: '0');
  TextEditingController doController = TextEditingController(text: '0');

  // getWeek() {
  //   var week = (DateTime.now().day - activation.activationAt!.day) / 7;
  //   return week.ceil();
  // }

  Future<void> editDailyWaterData(
      BuildContext context, Function doInPost) async {
    // ignore: unused_local_variable
    bool value = await DailyWaterService().editDailyWater(
        dailywaterId: dailyWaterController.selectedDailyWater.value.id,
        ph: phController.value.text,
        numDo: doController.value.text,
        // week: getWeek().toString(),
        temperature: temperatureController.value.text);
    await dailyWaterController.updateListAndSelectedDailyWater();
    doInPost();
  }

  Future<void> editDailyWaterDataOne(BuildContext context, Function doInPost,
      String ph, String doNm, String suhu) async {
    // ignore: unused_local_variable
    bool value = await DailyWaterService().editDailyWater(
        dailywaterId: dailyWaterController.selectedDailyWater.value.id,
        ph: ph,
        numDo: doNm,
        // week: getWeek().toString(),
        temperature: suhu);
    await dailyWaterController.updateListAndSelectedDailyWater();
    doInPost();
  }

  void setTextController() {
    phController.text =
        dailyWaterController.selectedDailyWater.value.ph.toString();
    doController.text =
        dailyWaterController.selectedDailyWater.value.numDo.toString();
    temperatureController.text =
        dailyWaterController.selectedDailyWater.value.temperature.toString();
  }

  @override
  void onInit() async {
    setTextController();
    super.onInit();
  }

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
}

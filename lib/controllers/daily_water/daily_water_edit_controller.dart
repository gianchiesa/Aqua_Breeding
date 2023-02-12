import 'dart:async';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/service/daily_water_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

class DailyWaterEditController extends GetxController {
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;

  TextEditingController descController = TextEditingController(text: '');
  // MaterialController materialController = MaterialController();
  // ShapeController shapeController = ShapeController();

  TextEditingController temperatureController =
      TextEditingController(text: '0');
  TextEditingController phController = TextEditingController(text: '0');
  TextEditingController doController = TextEditingController(text: '0');
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  DailyWater dailyWater = Get.arguments()["dailywater"];

  // getWeek() {
  //   var week = (DateTime.now().day - activation.activationAt!.day) / 7;
  //   return week.ceil();
  // }

  Future<void> editDailyWaterData(
      BuildContext context, Function doInPost) async {
    bool value = await DailyWaterService().editDailyWater(
        dailywaterId: dailyWater.id,
        ph: phController.value.text,
        numDo: doController.value.text,
        // week: getWeek().toString(),
        temperature: temperatureController.value.text);
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
}

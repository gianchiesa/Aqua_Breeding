import 'dart:async';
import 'package:fish/service/daily_water_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

class DailyWaterEntryController extends GetxController {
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

  getWeek() {
    var week = (DateTime.now().day - activation.activationAt!.day) / 7;
    return week.ceil();
  }

  final temp = ''.obs;
  final validatetemp = false.obs;
  void tempChanged(String val) {
    temp.value = val;
  }

  void valtemp() {
    validatetemp.value = true;
  }

  final doVal = ''.obs;
  final validatedoVal = false.obs;
  void doValChanged(String val) {
    doVal.value = val;
  }

  void valdoVal() {
    validatedoVal.value = true;
  }

  final ph = ''.obs;
  final validateph = false.obs;
  void phChanged(String val) {
    ph.value = val;
  }

  void valph() {
    validateph.value = true;
  }

  Future<void> postDailyWaterData(
      BuildContext context, Function doInPost) async {
    bool value = await DailyWaterService().postDailyWater(
        pondId: pond.id,
        activationId: activation.id,
        ph: phController.value.text,
        numDo: doController.value.text,
        week: getWeek().toString(),
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

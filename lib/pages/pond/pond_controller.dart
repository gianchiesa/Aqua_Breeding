import 'dart:async';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/service/pond_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'material_controller.dart';
import 'shape_controller.dart';

class PondController extends GetxController {
  var isLoading = false.obs;
  final ponds = <Pond>[].obs;

  TextEditingController aliasController = TextEditingController(text: '');
  TextEditingController locationController = TextEditingController(text: '');
  MaterialController materialController = MaterialController();
  ShapeController shapeController = ShapeController();
  TextEditingController diameterController = TextEditingController(text: '0');
  TextEditingController lengthController = TextEditingController(text: '0');
  TextEditingController widthController = TextEditingController(text: '0');
  TextEditingController heightController = TextEditingController(text: '0');

  @override
  void onInit() async {
    await getPondsData();
    super.onInit();
  }

  Future<void> getPondsData() async {
    isLoading.value = true;
    ponds.clear();
    List<Pond> pondsData = await PondService().getPonds();
    ponds.addAll(pondsData);

    isLoading.value = false;
  }

  Future<void> pondRegister() async {
    bool value = await PondService().pondRegister(
        alias: aliasController.text,
        location: locationController.text,
        shape: shapeController.selected.value,
        material: materialController.selected.value,
        length: lengthController.text,
        width: widthController.text,
        diameter: diameterController.text,
        height: heightController.text);
    print(value);
    await getPondsData();
    Get.to(() => DashboardPage());
  }
}

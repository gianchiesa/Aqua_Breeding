import 'dart:async';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/service/pond_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'material_controller.dart';
import 'shape_controller.dart';

class PondController extends GetxController {
  var isLoading = false.obs;
  final ponds = <Pond>[].obs;
  final pondFiltered = <Pond>[].obs;
  String token = '';
  String status = "Tidak Aktif";
  bool chipSelected = false;

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  TextEditingController aliasController = TextEditingController(text: '');
  TextEditingController locationController = TextEditingController(text: '');
  MaterialController materialController = MaterialController();
  ShapeController shapeController = ShapeController();
  TextEditingController diameterController = TextEditingController(text: '');
  TextEditingController lengthController = TextEditingController(text: '');
  TextEditingController widthController = TextEditingController(text: '');
  TextEditingController heightController = TextEditingController(text: '');
  final alias = ''.obs;
  final height = ''.obs;
  final width = ''.obs;
  final lenght = ''.obs;
  final diameter = ''.obs;
  final validatediameter = false.obs;
  final validatelenght = false.obs;
  final validateWidth = false.obs;
  final validateAlias = false.obs;
  final validateHeight = false.obs;

  void heightChanged(String val) {
    height.value = val;
  }

  void aliasChanged(String val) {
    alias.value = val;
  }

  void widthChanged(String val) {
    width.value = val;
  }

  void lenghtChanged(String val) {
    lenght.value = val;
  }

  void diameterChanged(String val) {
    diameter.value = val;
  }

  void valDiameter() {
    validatediameter.value = true;
  }

  void valLenght() {
    validatelenght.value = true;
  }

  void valWidth() {
    validateWidth.value = true;
  }

  void valAlias() {
    validateAlias.value = true;
  }

  void valHeight() {
    validateHeight.value = true;
  }

  Future<void> getPondsData(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token').toString();
    print(token);
    isLoading.value = true;
    ponds.clear();
    List<Pond> pondsData = await PondService().getPonds();
    ponds.addAll(pondsData);

    isLoading.value = false;
  }

  Future<void> pondRegister(BuildContext context, Function doInPost) async {
    bool value = await PondService().pondRegister(
        alias: aliasController.text.capitalize,
        location: locationController.text,
        shape: shapeController.selected.value,
        material: materialController.selected.value,
        length: lengthController.text,
        width: widthController.text,
        diameter: diameterController.text,
        status: status,
        height: heightController.text);
    print(value);
    doInPost();
    Get.to(() => DashboardPage());
  }

  Future<void> getPondsFiltered(String statusFilter) async {
    isLoading.value = true;
    ponds.clear();
    print(statusFilter);
    print(statusFilter);
    List<Pond> filter = await PondService().getPonds();
    for (var i in filter) {
      if (i.status == statusFilter) {
        ponds.clear();
        var testing = filter.where((element) => element.status == statusFilter);
        // print(testing.toString());
        ponds.addAll(testing);
        print(pondFiltered);
      }
      if (statusFilter == 'all') {
        ponds.addAll(filter);
      }
    }
    isLoading.value = false;
  }
}

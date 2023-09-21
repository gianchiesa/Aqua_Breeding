import 'dart:async';
import 'dart:developer';

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
  late Rx<Pond> selectedPond;
  String token = '';
  String identity = '';
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

  Pond getSelectedPond() {
    return ponds.firstWhere((pond) => pond.id == selectedPond.value.id);
  }

  void updateSelectedPond(pondid) {
    try {
      selectedPond.value = ponds.firstWhere((pond) => pond.id == pondid);
    } catch (e) {
      selectedPond = Rx<Pond>(ponds.firstWhere((pond) => pond.id == pondid));
    }
  }

  Future<void> updateListandSelectedPond() async {
    await getPondsData2();
    selectedPond.value =
        ponds.firstWhere((pond) => pond.id == selectedPond.value.id);
  }

  void setTextController() {
    locationController.text = selectedPond.value.location.toString();
    aliasController.text = selectedPond.value.alias.toString();
    materialController.setSelected(selectedPond.value.material.toString());
    shapeController.setSelected(selectedPond.value.shape.toString());
    if (selectedPond.value.shape == 'persegi') {
      widthController.text = selectedPond.value.width.toString();
      heightController.text = selectedPond.value.height.toString();
      lengthController.text = selectedPond.value.length.toString();
    } else {
      diameterController.text = selectedPond.value.diameter.toString();
      heightController.text = selectedPond.value.height.toString();
    }
  }

  Future<void> getPondsData(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token').toString();
    identity = prefs.getString('identity').toString();
    log("ini prefs $identity");
    isLoading.value = true;
    ponds.clear();
    List<Pond> pondsData = await PondService().getPonds();
    ponds.addAll(pondsData);
    inspect(ponds);

    isLoading.value = false;
  }

  Future<void> getPondsData2() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token').toString();
    identity = prefs.getString('identity').toString();
    log("ini prefs $identity");
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
        height: heightController.text,
        doInPost: doInPost,
        context: context);
    print(value);
  }

  Future<void> pondEdit(BuildContext context, String id) async {
    bool value = await PondService().pondEdit(
        id: selectedPond.value.id.toString(),
        alias: aliasController.text.capitalize,
        location: locationController.text,
        shape: shapeController.selected.value,
        material: materialController.selected.value,
        length: lengthController.text,
        width: widthController.text,
        diameter: diameterController.text,
        status: status,
        height: heightController.text,
        context: context);
    print(value);
    await getPondsData2();
    updateSelectedPond(selectedPond.value.id.toString());
    Get.back();
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

  late DateTime startTime;
  late DateTime endTime;
  final fitur = 'List Pond';

  void onInit() {
    startTime = DateTime.now();
    super.onInit();
  }
}

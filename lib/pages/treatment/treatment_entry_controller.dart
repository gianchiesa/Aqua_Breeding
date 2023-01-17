import 'dart:async';

import 'package:fish/pages/treatment/carbon_type_controller.dart';
import 'package:fish/service/treatment_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'treatment_type_controller.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/activation_model.dart';

class TreatmentEntryController extends GetxController {
  var isLoading = false.obs;
  // final ponds = <Pond>[].obs;

  TextEditingController descController = TextEditingController(text: '');
  // MaterialController materialController = MaterialController();
  // ShapeController shapeController = ShapeController();
  TypeController typeController = TypeController();
  CarbonTypeController carbonTypeController = CarbonTypeController();
  TextEditingController carbonTypeNullController =
      TextEditingController(text: '');
  TextEditingController waterController = TextEditingController(text: '0');
  TextEditingController saltController = TextEditingController(text: '0');
  TextEditingController probioticController = TextEditingController(text: '0');
  TextEditingController carbonController = TextEditingController(text: '0');
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];

  Future<void> postFishGrading(BuildContext context, Function doInPost) async {
    bool value = await TreatmentService().postPondTreatment(
        pondId: pond.id,
        salt: saltController.value.text,
        type: typeController.selected.value,
        probiotic: probioticController.value.text,
        desc: descController.value.text,
        water: waterController.value.text,
        carbohydrate: carbonController.value.text,
        carbohydrate_type: carbonTypeController.selected.value == "tidak ada"
            ? carbonTypeNullController.value.text
            : carbonTypeController.selected.value);
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

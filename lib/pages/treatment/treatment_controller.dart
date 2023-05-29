import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/treatment_model.dart';
import 'package:fish/service/treatment_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../service/logging_service.dart';

class TreatmentController extends GetxController {
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  var isLoading = false.obs;
  final listTreatment = <Treatment>[].obs;
  final listTreatmentTest = <Treatment>[].obs;
  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Pond Treatment';

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }

  // Future<void> getTreatmentData() async {
  //   isLoading.value = true;
  //   listTreatment.clear();
  //   Treatment feedHistoryMonthly = await TreatmentService().getTreatmentList();
  //   listTreatment.addAll(feedHistoryMonthly);
  //   isLoading.value = false;
  // }

  Future<void> getTreatmentData(BuildContext context) async {
    isLoading.value = true;
    listTreatmentTest.clear();
    List<Treatment> treatmentData = await TreatmentService().getTreatmentList();
    listTreatment.addAll(treatmentData);
    for (var i in treatmentData) {
      if (i.activation_id == activation.id) {
        print('treatment get test');
        listTreatmentTest.add(i);
      }
    }
    print(listTreatmentTest);
    // print(listTreatment.value);
    isLoading.value = false;
  }
}

// class TreatmentList {
//   TreatmentList(this.id, this.date, this.type);
//   final String id;
//   final String date;
//   final String type;
// }

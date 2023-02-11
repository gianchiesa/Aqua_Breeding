import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/daily_water_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DailyWaterAvgController extends GetxController {
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  var isLoading = false.obs;
  final listDailyWater = <DailyWater>[].obs;
  final listDailyWaterAvg = <DailyWater>[].obs;
  List sol = [].obs;

  // @override
  // void onReady() async {
  //   await getStatisticData();
  //   super.onReady();
  // }

  // Future<void> getTreatmentData() async {
  //   isLoading.value = true;
  //   listTreatment.clear();
  //   Treatment feedHistoryMonthly = await TreatmentService().getTreatmentList();
  //   listTreatment.addAll(feedHistoryMonthly);
  //   isLoading.value = false;
  // }

  Future<void> getDailyWaterData(BuildContext context) async {
    isLoading.value = true;
    listDailyWater.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService().getPonds();
    for (var i in dailyWaterData) {
      if (i.activationId == activation.id) {
        print('daily Water get test');
        listDailyWater.add(i);
      }
    }
    print(listDailyWater);
    formattedList(listDailyWater);
    // print(listTreatment.value);
    isLoading.value = false;
  }

  Future<void> getDailyWaterDataAvg(BuildContext context) async {
    isLoading.value = true;
    listDailyWater.clear();
    List<DailyWater> dailyWaterData = await DailyWaterService().getPonds();
    for (var i in dailyWaterData) {
      if (i.activationId == activation.id) {
        print('daily Water get test');
        listDailyWater.add(i);
      }
    }

    // print(listTreatment.value);
    isLoading.value = false;
  }

  List formattedList(List<DailyWater> listDailyWater) {
    var obj = {};

    for (var i = 0; i < listDailyWater.length; i++) {
      if (obj[listDailyWater[i].week] == null) {
        obj[listDailyWater[i].week] = {
          "count": 1,
          "ph": listDailyWater[i].ph,
          "numDo": listDailyWater[i].numDo,
          "temperature": listDailyWater[i].temperature
        };
      } else {
        obj[listDailyWater[i].week]["count"] += 1;
        obj[listDailyWater[i].week]["ph"] += listDailyWater[i].ph;
        obj[listDailyWater[i].week]["numDo"] += listDailyWater[i].numDo;
        obj[listDailyWater[i].week]["temperature"] +=
            listDailyWater[i].temperature;
      }
    }

    for (var key in obj.keys) {
      sol.add({
        "week": key,
        "ph": obj[key]["ph"] / obj[key]["count"],
        "numDo": obj[key]["numDo"] / obj[key]["count"],
        "temperature": obj[key]["temperature"] / obj[key]["count"]
      });
    }
    print(sol);
    return sol;
  }
}


// class TreatmentList {
//   TreatmentList(this.id, this.date, this.type);
//   final String id;
//   final String date;
//   final String type;
// }

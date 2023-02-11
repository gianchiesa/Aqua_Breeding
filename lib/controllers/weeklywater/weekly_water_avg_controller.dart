import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/weekly_water_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class WeeklyWaterAvgController extends GetxController {
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  var isLoading = false.obs;
  final listWeeklyWater = <WeeklyWater>[].obs;
  final listWeeklyWaterAvg = <WeeklyWater>[].obs;
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
    listWeeklyWater.clear();
    List<WeeklyWater> weeklyWaterData = await WeeklyWaterService().getDatas();
    for (var i in weeklyWaterData) {
      if (i.activationId == activation.id) {
        print('Weekly Water get test');
        listWeeklyWater.add(i);
      }
    }
    print(listWeeklyWater);
    formattedList(listWeeklyWater);
    // print(listTreatment.value);
    isLoading.value = false;
  }

  Future<void> getWeeklyWaterDataAvg(BuildContext context) async {
    isLoading.value = true;
    listWeeklyWater.clear();
    List<WeeklyWater> weeklyWaterData = await WeeklyWaterService().getDatas();
    for (var i in weeklyWaterData) {
      if (i.activationId == activation.id) {
        print('Weekly Water get test');
        listWeeklyWater.add(i);
      }
    }

    // print(listTreatment.value);
    isLoading.value = false;
  }

  List formattedList(List<WeeklyWater> listWeeklyWater) {
    var obj = {};

    for (var i = 0; i < listWeeklyWater.length; i++) {
      if (obj[listWeeklyWater[i].week] == null) {
        obj[listWeeklyWater[i].week] = {
          "count": 1,
          "floc": listWeeklyWater[i].floc,
          "nitrite": listWeeklyWater[i].nitrite,
          "nitrate": listWeeklyWater[i].nitrate,
          "hardness": listWeeklyWater[i].hardness,
          "ammonia": listWeeklyWater[i].ammonia
        };
      } else {
        obj[listWeeklyWater[i].week]["count"] += 1;
        obj[listWeeklyWater[i].week]["floc"] += listWeeklyWater[i].floc;
        obj[listWeeklyWater[i].week]["nitrite"] += listWeeklyWater[i].nitrite;
        obj[listWeeklyWater[i].week]["nitrate"] += listWeeklyWater[i].nitrate;
        obj[listWeeklyWater[i].week]["hardness"] += listWeeklyWater[i].hardness;
        obj[listWeeklyWater[i].week]["ammonia"] += listWeeklyWater[i].ammonia;
      }
    }

    for (var key in obj.keys) {
      sol.add({
        "week": key,
        "floc": obj[key]["floc"] / obj[key]["count"],
        "nitrite": obj[key]["nitrite"] / obj[key]["count"],
        "nitrate": obj[key]["nitrate"] / obj[key]["count"],
        "hardness": obj[key]["hardness"] / obj[key]["count"],
        "ammonia": obj[key]["ammonia"] / obj[key]["count"],
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

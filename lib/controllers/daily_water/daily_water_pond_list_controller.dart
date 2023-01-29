import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/pond_service.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/service/daily_water_service.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class DailyWaterPondListController extends GetxController {
  var isLoading = false.obs;
  final ponds = <Pond>[].obs;
  final waters = <DailyWater>[].obs;
  final dailywaters = <DailyWater>[].obs;
  final idStore = <String>[].obs;
  final indicatorWater = <DailyWater>[].obs;

  @override
  void onInit() async {
    await getPondsData();
    await getWatersData();
    super.onInit();
  }

  Future<void> getPondsData() async {
    indicatorWater.clear();
    idStore.clear();
    ponds.clear();
    var index = 0;
    List<Pond> pondsData = await PondService().getPonds();
    ponds.addAll(pondsData);
    for (var i in pondsData) {
      idStore.add(pondsData[index].id.toString());
      index++;
      print(idStore);
    }
    index = 0;
    isLoading.value = false;
  }

  Future<void> getWatersData() async {
    isLoading.value = true;
    waters.clear();
    var waterindex = 0;
    List<DailyWater> watersData = await DailyWaterService().getPonds();
    waters.addAll(watersData);
    for (var i in watersData) {
      print(i.pondId);
      if (waterindex < idStore.length) {
        if (i.pondId == idStore[waterindex]) {
          var testing =
              waters.firstWhereOrNull((element) => element.pondId == i.pondId);
          // print(testing.toString());
          indicatorWater.add(testing!);
          waterindex++;
        } else {
          print('dummy');
        }
      }
    }
    print(waterindex);
    for (var j in watersData) {
      if (indicatorWater.length < idStore.length + 1) {
        indicatorWater.add(j);
        print(indicatorWater.length);
      }
    }
    waterindex = 0;
    isLoading.value = false;
  }
}

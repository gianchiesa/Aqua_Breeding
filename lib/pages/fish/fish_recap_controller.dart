import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_death_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/fish_live_model.dart';
import '../../service/logging_service.dart';

class FishRecapController extends GetxController {
  final list_fishDeath = <FishDeath>[].obs;
  final charData = <FishLiveData>[].obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  // var fishlive = activation.fishAmount.obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    getFishDeaths(activation_id: activation.id!);
    getcharData(activation_id: activation.id!);

    // inspect(charData);
    super.onInit();
  }

  Future<void> getFishDeaths({required String activation_id}) async {
    isLoading.value = true;
    list_fishDeath.clear();
    List<FishDeath> fishHistory =
        await FishDeathService().fetchFishDeaths(activationId: activation_id);
    list_fishDeath.addAll(fishHistory);
    print(list_fishDeath);
  }

  Future<void> getcharData({required String activation_id}) async {
    isLoading.value = true;
    charData.clear();
    int fishamount = activation.fishAmount!;
    List<FishLiveData> fishHistory =
        await FishDeathService().fetchFishLive(activationId: activation_id);
    // charData.addAll(fishHistory);
    for (var i in fishHistory) {
      var date = DateTime.parse(i.date.toString());
      // DateFormat format = DateFormat("dd-MM-yyyy");
      var dateformat = DateFormat('yyyy-MM-dd').format(date);
      DateTime? formatdate = DateTime.parse(dateformat);
      // var datetime = format.parse(i.getDate());
      fishamount += int.parse(i.amount.toString());
      var data = FishLiveData(
          amount: fishamount, fishType: i.fishType, date: formatdate);
      charData.add(data);
      // print(formatdate);
    }
    inspect(charData);
    isLoading.value = false;
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Fish Death';

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }

  @override
  void dispose() {
    postDataLog(fitur);
    super.dispose();
  }
}

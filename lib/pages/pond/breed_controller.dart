import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fish_live_model.dart';
import 'package:fish/models/fishchart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/activation_service.dart';
import 'package:get/get.dart';

import '../../service/logging_service.dart';

class BreedController extends GetxController {
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  var isLoading = false.obs;
  final charData = <FishChartData>[].obs;
  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Detail Activation';

  @override
  void onInit() async {
    // getFishChart(
    //     activation_id: detailPondController.selectedActivation.value.id!);
    super.onInit();
  }

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }

  Future<void> getFishChart({required String activation_id}) async {
    isLoading.value = true;
    charData.clear();

    List<FishChartData> fishdatas =
        await ActivationService().getFishChart(activationId: activation_id);
    charData.value = fishdatas;
    inspect(charData);
    isLoading.value = false;
  }

  @override
  void dispose() {
    postDataLog(fitur);
    super.dispose();
  }
}

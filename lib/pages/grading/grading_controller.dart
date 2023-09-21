import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/grading_chart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:get/get.dart';

import '../../service/logging_service.dart';

class GradingController extends GetxController {
  var isLoading = false.obs;
  var isPatin = false.obs;
  var isLele = false.obs;
  var isMas = false.obs;
  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;

  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final list_fishGrading = <FishGrading>[].obs;
  late Rx<FishGradingChart> fishGradingChart;

  @override
  void onInit() async {
    await getFishGradingChart(activation_id: activation.id!);
    await getFishGrading(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getFishGrading({required String activation_id}) async {
    isLoading.value = true;
    list_fishGrading.clear();
    List<FishGrading> feedHistoryMonthly = await FishGradingService()
        .fetchFishGradings(activationId: activation_id);
    list_fishGrading.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }

  Future<void> getFishGradingChart({required String activation_id}) async {
    isLoading.value = true;
    FishGradingChart fishGradingChartReturn = await FishGradingService()
        .fetchChartFishGradings(activationId: activation_id);
    updateFishGradingChart(fishGradingChartReturn);
    inspect(fishGradingChart);
    isLoading.value = false;
  }

  void updateFishGradingChart(FishGradingChart fishGradingChartReturn) {
    try {
      fishGradingChart.value = fishGradingChartReturn;
    } catch (e) {
      fishGradingChart = Rx<FishGradingChart>(fishGradingChartReturn);
    }
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Grading';

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

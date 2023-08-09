import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/grading_chart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:get/get.dart';

import '../../service/logging_service.dart';

class GradingController extends GetxController {
  final charNilaMerahData = <GradingChartData>[].obs;
  final charLeleData = <GradingChartData>[].obs;
  final charMasData = <GradingChartData>[].obs;
  final charNilaHitamData = <GradingChartData>[].obs;
  final charPatinData = <GradingChartData>[].obs;
  var isLoading = false.obs;
  var isPatin = false.obs;
  var isLele = false.obs;
  var isMas = false.obs;
  var isNilaMerah = false.obs;
  var isNilaHitam = false.obs;

  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final list_fishGrading = <FishGrading>[].obs;

  @override
  void onInit() async {
    getFishGrading(activation_id: activation.id!);
    getFishGradingChart(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getFishGradingChart({required String activation_id}) async {
    isLoading.value = true;
    charNilaMerahData.clear();
    charLeleData.clear();
    charMasData.clear();
    charNilaHitamData.clear();
    charPatinData.clear();
    List<GradingChartData> gradingChartData = await FishGradingService()
        .fetchChartFishGradings(activationId: activation_id);
    // list_fishGrading.addAll(gradingChartData);
    for (var i in gradingChartData) {
      if (i.fish_type!.toUpperCase() == 'LELE') {
        isLele.value = true;
        charLeleData.add(i);
      }
      if (i.fish_type!.toUpperCase() == 'MAS') {
        isMas.value = true;
        charMasData.add(i);
      }
      if (i.fish_type!.toUpperCase() == 'PATIN') {
        isPatin.value = true;
        charPatinData.add(i);
      }
      if (i.fish_type!.toUpperCase() == 'NILA MERAH') {
        isNilaMerah.value = true;
        charNilaMerahData.add(i);
      }
      if (i.fish_type!.toUpperCase() == 'NILA HITAM') {
        isNilaHitam.value = true;
        charNilaHitamData.add(i);
      }
    }
    print("penanda");
    print(charLeleData);
    isLoading.value = false;
  }

  Future<void> getFishGrading({required String activation_id}) async {
    isLoading.value = true;
    list_fishGrading.clear();
    List<FishGrading> feedHistoryMonthly = await FishGradingService()
        .fetchFishGradings(activationId: activation_id);
    list_fishGrading.addAll(feedHistoryMonthly);
    isLoading.value = false;
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

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:get/get.dart';

class GradingController extends GetxController {
  final List<GradingNilaMerahData> charNilaMerahData = [
    GradingNilaMerahData(50, '02-07-2022'),
    GradingNilaMerahData(70, '04-08-2022'),
    GradingNilaMerahData(100, '03-09-2022'),
    GradingNilaMerahData(150, '01-10-2022'),
    GradingNilaMerahData(200, '08-11-2022'),
  ].obs;
  final List<GradingLeleData> charLeleData = [
    GradingLeleData(30, '02-07-2022'),
    GradingLeleData(60, '04-08-2022'),
    GradingLeleData(100, '03-09-2022'),
    GradingLeleData(140, '01-10-2022'),
    GradingLeleData(220, '08-11-2022'),
  ].obs;
  final List<GradingNilaHitamData> charNilaHitamData = [
    GradingNilaHitamData(40, '02-07-2022'),
    GradingNilaHitamData(80, '04-08-2022'),
    GradingNilaHitamData(110, '03-09-2022'),
    GradingNilaHitamData(150, '01-10-2022'),
    GradingNilaHitamData(210, '08-11-2022'),
  ].obs;
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final list_fishGrading = <FishGrading>[].obs;

  @override
  void onInit() async {
    getFishGradings(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getFishGradings({required String activation_id}) async {
    isLoading.value = true;
    list_fishGrading.clear();
    List<FishGrading> feedHistoryMonthly = await FishGradingService()
        .fetchFishGradings(activationId: activation_id);
    list_fishGrading.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}

class GradingNilaMerahData {
  GradingNilaMerahData(this.avgweight, this.date);
  final double avgweight;
  final String date;
}

class GradingLeleData {
  GradingLeleData(this.avgweight, this.date);
  final double avgweight;
  final String date;
}

class GradingNilaHitamData {
  GradingNilaHitamData(this.avgweight, this.date);
  final double avgweight;
  final String date;
}

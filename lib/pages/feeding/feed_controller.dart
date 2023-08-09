import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/feed_chart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../service/logging_service.dart';

class FeedController extends GetxController {
  final isLoading = false.obs;
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  final charData = <FeedChartData>[].obs;
  final list_feedHistoryMonthly = <FeedHistoryMonthly>[].obs;
  late Rx<FeedHistoryMonthly> selectedFeedHistoryMonthly;

  @override
  void onInit() async {
    isLoading.value = true;
    print(detailPondController.selectedActivation.value.id);
    await getWeeklyRecapFeedHistory(
        activation_id: detailPondController.selectedActivation.value.id!);
    await getChartFeed(
        activation_id: detailPondController.selectedActivation.value.id!);
    isLoading.value = false;

    super.onInit();
  }

  Future<void> getWeeklyRecapFeedHistory(
      {required String activation_id}) async {
    isLoading.value = true;
    list_feedHistoryMonthly.clear();
    List<FeedHistoryMonthly> feedHistoryMonthly = await FeedHistoryService()
        .getMonthlyRecap(activation_id: activation_id);
    list_feedHistoryMonthly.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }

  void updateSelectedFeedHistoryMonthly(dateFeedHistoryMonthly) {
    try {
      selectedFeedHistoryMonthly.value = list_feedHistoryMonthly.firstWhere(
          (feedHistoryMonthly) =>
              feedHistoryMonthly.date == dateFeedHistoryMonthly);
    } catch (e) {
      selectedFeedHistoryMonthly = Rx<FeedHistoryMonthly>(
          list_feedHistoryMonthly.firstWhere((feedHistoryMonthly) =>
              feedHistoryMonthly.date == dateFeedHistoryMonthly));
    }
  }

  Future<void> updateListandFeedHistoryMonthly() async {
    await getWeeklyRecapFeedHistory(
        activation_id: detailPondController.selectedActivation.value.id!);
    selectedFeedHistoryMonthly.value = list_feedHistoryMonthly.firstWhere(
        (feedHistoryMonthly) =>
            feedHistoryMonthly.date == selectedFeedHistoryMonthly.value.date);
  }

  Future<void> getChartFeed({required String activation_id}) async {
    charData.clear();
    List<FeedChartData> feedChart =
        await FeedHistoryService().getChart(activation_id: activation_id);
    // list_feedHistoryMonthly.addAll(feedHistoryMonthly);
    for (var i in feedChart) {
      var data = FeedChartData(feeddose: i.feeddose, date: i.date);
      charData.add(data);
      // print(formatdate);
    }
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Feeding';

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

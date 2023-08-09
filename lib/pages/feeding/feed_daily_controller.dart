import 'package:fish/models/FeedHistoryDaily.dart';
import 'package:fish/models/FeedHistoryHourly.dart';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/feed_controller.dart';
import 'package:fish/pages/feeding/feed_monthly_controller.dart';
import 'package:fish/pages/feeding/feed_weekly_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedDailyController extends GetxController {
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  final FeedController feedController = Get.find();
  final FeedMonthlyController feedMonthlyController = Get.find();
  final FeedWeeklyController feedWeeklyController = Get.find();

  var isLoading = false.obs;
  final list_feedHistoryHourly = <FeedHistoryHourly>[].obs;
  late Rx<FeedHistoryHourly> selectedFeedHistoryHourly;

  @override
  void onInit() async {
    getHourlyRecapFeedHistory(
        activation_id: detailPondController.selectedActivation.value.id!,
        date: feedWeeklyController.selectedFeedHistoryDaily.value.getDate());
    super.onInit();
  }

  void updateSelectedFeedHistoryHourly(dateFeedHistoryHourly) {
    try {
      selectedFeedHistoryHourly.value = list_feedHistoryHourly.firstWhere(
          (feedHistoryHourly) =>
              feedHistoryHourly.date == dateFeedHistoryHourly);
    } catch (e) {
      selectedFeedHistoryHourly = Rx<FeedHistoryHourly>(
          list_feedHistoryHourly.firstWhere((feedHistoryHourly) =>
              feedHistoryHourly.date == dateFeedHistoryHourly));
    }
  }

  Future<void> updateListandFeedHistoryHourly() async {
    await getHourlyRecapFeedHistory(
        date: feedWeeklyController.selectedFeedHistoryDaily.value.getDate(),
        activation_id: detailPondController.selectedActivation.value.id!);
    selectedFeedHistoryHourly.value = list_feedHistoryHourly.firstWhere(
        (feedHistoryHourly) =>
            feedHistoryHourly.date == selectedFeedHistoryHourly.value.date);
  }

  Future<void> getHourlyRecapFeedHistory(
      {required String activation_id, required String date}) async {
    isLoading.value = true;
    list_feedHistoryHourly.clear();
    List<FeedHistoryHourly> feedHistoryMonthly = await FeedHistoryService()
        .getHourlyRecap(activation_id: activation_id, date: date);
    list_feedHistoryHourly.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}

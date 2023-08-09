import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/feed_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedMonthlyController extends GetxController {
  // Activation activation = Get.arguments["activation"];
  // Pond pond = Get.arguments["pond"];
  // FeedHistoryMonthly feedHistoryMonthly = Get.arguments['feedHistoryMonthly'];
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  final FeedController feedController = Get.find();
  final isLoading = false.obs;
  final list_feedHistoryWeekly = <FeedHistoryWeekly>[].obs;
  late Rx<FeedHistoryWeekly> selectedFeedHistoryWeekly;

  @override
  void onInit() async {
    getWeeklyRecapFeedHistory(
        activation_id: detailPondController.selectedActivation.value.id!,
        month: feedController.selectedFeedHistoryMonthly.value.getMonth());
    super.onInit();
  }

  void updateSelectedFeedHistoryWeekly(weekFeedHistoryWeekly) {
    try {
      selectedFeedHistoryWeekly.value = list_feedHistoryWeekly.firstWhere(
          (feedHistoryWeekly) =>
              feedHistoryWeekly.week == weekFeedHistoryWeekly);
    } catch (e) {
      selectedFeedHistoryWeekly = Rx<FeedHistoryWeekly>(
          list_feedHistoryWeekly.firstWhere((feedHistoryWeekly) =>
              feedHistoryWeekly.week == weekFeedHistoryWeekly));
    }
  }

  Future<void> updateListandFeedHistoryWeekly() async {
    await getWeeklyRecapFeedHistory(
        month: feedController.selectedFeedHistoryMonthly.value.getMonth(),
        activation_id: detailPondController.selectedActivation.value.id!);
    selectedFeedHistoryWeekly.value = list_feedHistoryWeekly.firstWhere(
        (feedHistoryWeekly) =>
            feedHistoryWeekly.week == selectedFeedHistoryWeekly.value.week);
  }

  Future<void> getWeeklyRecapFeedHistory(
      {required String activation_id, required String month}) async {
    isLoading.value = true;
    list_feedHistoryWeekly.clear();
    List<FeedHistoryWeekly> feedHistoryMonthly = await FeedHistoryService()
        .getWeeklyRecap(activation_id: activation_id, month: month);
    list_feedHistoryWeekly.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}

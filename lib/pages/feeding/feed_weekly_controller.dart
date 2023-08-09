import 'package:fish/models/FeedHistoryDaily.dart';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/feed_controller.dart';
import 'package:fish/pages/feeding/feed_monthly_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedWeeklyController extends GetxController {
  // Activation activation = Get.arguments["activation"];
  // Pond pond = Get.arguments["pond"];
  // FeedHistoryMonthly feedHistoryMonthly = Get.arguments['feedHistoryMonthly'];
  // FeedHistoryWeekly feedHistoryWeekly = Get.arguments['feedHistoryWeekly'];
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  final FeedController feedController = Get.find();
  final FeedMonthlyController feedMonthlyController = Get.find();

  var isLoading = false.obs;
  final list_feedHistoryDaily = <FeedHistoryDaily>[].obs;
  late Rx<FeedHistoryDaily> selectedFeedHistoryDaily;

  @override
  void onInit() async {
    getDailyRecapFeedHistory(
        activation_id: detailPondController.selectedActivation.value.id!,
        week: feedMonthlyController.selectedFeedHistoryWeekly.value.week
            .toString());
    super.onInit();
  }

  Future<void> getDailyRecapFeedHistory(
      {required String activation_id, required String week}) async {
    isLoading.value = true;
    list_feedHistoryDaily.clear();
    List<FeedHistoryDaily> feedHistoryMonthly = await FeedHistoryService()
        .getDailyRecap(activation_id: activation_id, week: week);
    list_feedHistoryDaily.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }

  void updateSelectedFeedHistoryDaily(dateFeedHistoryDaily) {
    try {
      selectedFeedHistoryDaily.value = list_feedHistoryDaily.firstWhere(
          (feedHistoryDaily) => feedHistoryDaily.date == dateFeedHistoryDaily);
    } catch (e) {
      selectedFeedHistoryDaily = Rx<FeedHistoryDaily>(
          list_feedHistoryDaily.firstWhere((feedHistoryDaily) =>
              feedHistoryDaily.date == dateFeedHistoryDaily));
    }
  }

  Future<void> updateListandFeedHistoryDaily() async {
    await getDailyRecapFeedHistory(
        week: feedMonthlyController.selectedFeedHistoryWeekly.value.week
            .toString(),
        activation_id: detailPondController.selectedActivation.value.id!);
    selectedFeedHistoryDaily.value = list_feedHistoryDaily.firstWhere(
        (feedHistoryDaily) =>
            feedHistoryDaily.date == selectedFeedHistoryDaily.value.date);
  }
}

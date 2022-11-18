import 'package:fish/models/FeedHistoryDaily.dart';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedWeeklyController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  FeedHistoryMonthly feedHistoryMonthly = Get.arguments()['feedHistoryMonthly'];
  FeedHistoryWeekly feedHistoryWeekly = Get.arguments()['feedHistoryWeekly'];
  final list_feedHistoryDaily = <FeedHistoryDaily>[].obs;

  @override
  void onInit() async {
    getDailyRecapFeedHistory(
        activation_id: activation.id!, week: feedHistoryWeekly.week.toString());
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
}

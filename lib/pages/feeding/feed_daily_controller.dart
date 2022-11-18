import 'package:fish/models/FeedHistoryDaily.dart';
import 'package:fish/models/FeedHistoryHourly.dart';
import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedDailyController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  FeedHistoryMonthly feedHistoryMonthly = Get.arguments()['feedHistoryMonthly'];
  FeedHistoryWeekly feedHistoryWeekly = Get.arguments()['feedHistoryWeekly'];
  FeedHistoryDaily feedHistoryDaily = Get.arguments()['feedHistoryDaily'];
  final list_feedHistoryHourly = <FeedHistoryHourly>[].obs;

  @override
  void onInit() async {
    getHourlyRecapFeedHistory(
        activation_id: activation.id!, date: feedHistoryDaily.getDate());
    super.onInit();
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

import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/feed_chart_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FeedController extends GetxController {
  final charData = <FeedChartData>[].obs;
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final list_feedHistoryMonthly = <FeedHistoryMonthly>[].obs;

  @override
  void onInit() async {
    getWeeklyRecapFeedHistory(activation_id: activation.id!);
    getChartFeed(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getWeeklyRecapFeedHistory(
      {required String activation_id}) async {
    isLoading.value = true;
    list_feedHistoryMonthly.clear();
    List<FeedHistoryMonthly> feedHistoryMonthly = await FeedHistoryService()
        .getMonthlyRecap(activation_id: activation_id);
    list_feedHistoryMonthly.addAll(feedHistoryMonthly);
  }

  Future<void> getChartFeed({required String activation_id}) async {
    isLoading.value = true;
    charData.clear();
    List<FeedChartData> feedChart =
        await FeedHistoryService().getChart(activation_id: activation_id);
    // list_feedHistoryMonthly.addAll(feedHistoryMonthly);
    for (var i in feedChart) {
      var date = DateTime.parse(i.date.toString());
      // DateFormat format = DateFormat("dd-MM-yyyy");
      var dateformat = DateFormat('yyyy-MM-dd').format(date);
      DateTime? formatdate = DateTime.parse(dateformat);
      // var datetime = format.parse(i.getDate());
      var data = FeedChartData(amount: i.amount, date: formatdate);
      charData.add(data);
      // print(formatdate);
    }
    isLoading.value = false;
  }
}

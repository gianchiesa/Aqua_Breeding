import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final List<FeedData> charData = [
    FeedData(1, 'Hari Ke-1'),
    FeedData(2, 'Hari Ke-2'),
    FeedData(3, 'Hari Ke-3'),
    FeedData(4, 'Hari Ke-4'),
    FeedData(5, 'Hari Ke-5'),
    FeedData(6, 'Hari Ke-6'),
    FeedData(7, 'Hari Ke-7'),
    FeedData(8, 'Hari Ke-9'),
  ].obs;
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final list_feedHistoryMonthly = <FeedHistoryMonthly>[].obs;

  @override
  void onInit() async {
    getWeeklyRecapFeedHistory(activation_id: activation.id!);
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
}

class FeedData {
  FeedData(this.amount, this.day);
  final double amount;
  final String day;
}

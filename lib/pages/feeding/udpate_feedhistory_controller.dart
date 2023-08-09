import 'package:fish/pages/feeding/feed_daily_controller.dart';
import 'package:fish/pages/feeding/update_feedHistory_page.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateFeedHistoryController extends GetxController {
  final FeedDailyController feedDailyController = Get.find();
  final isLoading = false.obs;
  final TextEditingController doseController = TextEditingController(text: '');

  @override
  void onInit() async {
    setTextController();
    super.onInit();
  }

  void setTextController() {
    doseController.text = feedDailyController
        .selectedFeedHistoryHourly.value.totalFeedWeight
        .toString();
  }

  Future<void> editFeedHistory() async {
    bool value = await FeedHistoryService().putFeedHistory(
      feedHistoryId: feedDailyController.selectedFeedHistoryHourly.value.id,
      feedDose: doseController.text,
    );
    print(value);
  }
}

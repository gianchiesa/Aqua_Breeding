import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/feedtype_form_controller.dart';
import 'package:fish/pages/feeding/satuan_feed_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';
import '../../service/logging_service.dart';

class FeedEntryController extends GetxController {
  FeedTypeFormController feedTypeFormController = FeedTypeFormController();

  FeedSatuanController feedSatuanController = FeedSatuanController();
  TextEditingController feedDosisController = TextEditingController(text: '');
  var isLoading = false.obs;
  Pond pond = Get.arguments['pond'];
  Activation activation = Get.arguments["activation"];
  final dose = ''.obs;
  final validatedose = false.obs;

  void doseChanged(String val) {
    dose.value = val;
  }

  void valdose() {
    validatedose.value = true;
  }

  @override
  void onInit() async {
    isLoading = false.obs;
    await feedTypeFormController.getData();

    isLoading = true.obs;
    super.onInit();
  }

  Future<void> postFeedHistory() async {
    bool value = await FeedHistoryService().postFeedHistory(
      pondId: pond.id,
      feedTypeId: feedTypeFormController.getIdByName(),
      feedDose: feedSatuanController.selected.value == "gram"
          ? (double.parse(feedDosisController.text) / 1000).toStringAsFixed(1)
          : feedDosisController.text,
    );
    print(value);
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
    feedDosisController.clear();
    postDataLog(fitur);
    super.dispose();
  }
}

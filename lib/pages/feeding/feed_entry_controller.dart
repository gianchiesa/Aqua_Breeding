import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/feedtype_form_controller.dart';
import 'package:fish/service/feed_history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedEntryController extends GetxController {
  FeedTypeFormController feedTypeFormController = FeedTypeFormController();
  TextEditingController feedDosisController = TextEditingController(text: '');
  var isLoading = false.obs;
  Pond pond = Get.arguments()['pond'];

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
      feedDose: feedDosisController.text,
    );
    print(value);
    Get.back();
  }
}

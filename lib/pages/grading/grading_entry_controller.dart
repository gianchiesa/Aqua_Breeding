import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/grading/fish_type_controller.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradingEntryController extends GetxController {
  TextEditingController fishWeightController = TextEditingController(text: '');
  TextEditingController undersizeController = TextEditingController(text: '');
  TextEditingController oversizeController = TextEditingController(text: '');
  TextEditingController normalsizeController = TextEditingController(text: '');
  TextEditingController fishLengthAvgController =
      TextEditingController(text: '');
  TextEditingController sampleAmountController =
      TextEditingController(text: '');
  FishTypeController fishTypeController = FishTypeController();
  var isLoading = false.obs;
  Pond pond = Get.arguments();

  Future<void> postFishGrading() async {
    bool value = await FishGradingService().postFishGrading(
      pondId: pond.id,
      fishType: fishTypeController.selected.value,
      samplingAmount: sampleAmountController.value.text,
      avgFishWeight: fishWeightController.value.text,
      avgFishLong: fishLengthAvgController.value.text,
      amountNormal: normalsizeController.value.text,
      amountOver: oversizeController.value.text,
      amountUnder: undersizeController.value.text,
    );
    print(value);
    Get.back();
  }
}

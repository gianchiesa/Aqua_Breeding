import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/grading/fish_type_controller.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';
import '../../service/logging_service.dart';

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
  Pond pond = Get.arguments['pond'];
  Activation activation = Get.arguments["activation"];
  RxList<String> listFishAlive = List<String>.empty().obs;

  Future<void> getFish() async {
    isLoading.value = true;
    listFishAlive.add("pilih ikan");
    for (var i in activation.fishLive!) {
      listFishAlive.add(i.type!);
      print(listFishAlive);
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getFish();
  }

  final fishWeight = ''.obs;
  final validatefishWeight = false.obs;
  void fishWeightChanged(String val) {
    fishWeight.value = val;
  }

  void valfishWeight() {
    validatefishWeight.value = true;
  }

  final fishLenght = ''.obs;
  final validatefishLenght = false.obs;
  void fishLenghtChanged(String val) {
    fishLenght.value = val;
  }

  void valfishLenght() {
    validatefishLenght.value = true;
  }

  final sampleAmount = ''.obs;
  final validatesampleAmount = false.obs;
  void sampleAmountChanged(String val) {
    sampleAmount.value = val;
  }

  void valsampleAmount() {
    validatesampleAmount.value = true;
  }

  final undersize = ''.obs;
  final validateundersize = false.obs;
  void undersizeChanged(String val) {
    undersize.value = val;
  }

  void valundersize() {
    validateundersize.value = true;
  }

  final oversize = ''.obs;
  final validateoversize = false.obs;
  void oversizeChanged(String val) {
    oversize.value = val;
  }

  void valoversize() {
    validateoversize.value = true;
  }

  final normal = ''.obs;
  final validatenormal = false.obs;
  void normalChanged(String val) {
    normal.value = val;
  }

  void valnormal() {
    validatenormal.value = true;
  }

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
  }

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Grading';

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);

    print(value);
  }

  @override
  void dispose() {
    postDataLog(fitur);
    sampleAmountController.clear();
    fishWeightController.clear();
    fishLengthAvgController.clear();
    normalsizeController.clear();
    oversizeController.clear();
    undersizeController.clear();
    super.dispose();
  }
}

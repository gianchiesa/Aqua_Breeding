import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/grading/fish_type_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/service/fish_grading_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';
import '../../service/logging_service.dart';

class GradingEntryController extends GetxController {
  FishTypeController fishTypeController = FishTypeController();
  TextEditingController sampleAmountController =
      TextEditingController(text: '0');
  TextEditingController fishWeightController = TextEditingController(text: '0');
  TextEditingController fishLengthAvgController =
      TextEditingController(text: '0');
  TextEditingController normalsizeController = TextEditingController(text: '0');
  TextEditingController undersizeController = TextEditingController(text: '0');
  TextEditingController oversizeController = TextEditingController(text: '0');
  var isLoading = false.obs;
  Pond pond = Get.arguments['pond'];
  Activation activation = Get.arguments["activation"];
  RxList<String> listFishAlive = List<String>.empty().obs;
  DetailPondController detailPondController = Get.find();
  final persentageSample = 0.0.obs;

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

  Map<String, dynamic> validationInput() {
    Map<String, dynamic> result = {
      'isValid': false,
      'message': '',
    };
    if (sampleAmountController.text.isEmpty ||
        int.parse(sampleAmountController.text) == 0) {
      result['isValid'] = false;
      result['message'] = "Isi jumlah sample dengan angka > 0";
      return result;
    }
    if (fishWeightController.text.isEmpty ||
        double.parse(fishWeightController.text) == 0) {
      result['isValid'] = false;
      result['message'] = "Isi berat total sample ikan dengan angka > 0";
      return result;
    }
    result['isValid'] = true;
    result['message'] = "Isian sudah benar";
    return result;
  }

  void updatePersentageSample() {
    double persentage = double.parse(sampleAmountController.text);
    persentageSample.value = 100 *
        double.parse(sampleAmountController.text) /
        double.parse(detailPondController.selectedActivation.value.fishAmount
            .toString());
  }

  Future<void> postFishGrading() async {
    double avgWeigt = double.parse(sampleAmountController.text) /
        double.parse(fishWeightController.text);
    bool value = await FishGradingService().postFishGrading(
      pondId: pond.id,
      avgWeight: avgWeigt.toString(),
      sampleAmount: sampleAmountController.text,
      sampleWeight: fishWeightController.text,
      sampleLength: fishLengthAvgController.text,
    );
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

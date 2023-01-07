import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/treatment_model.dart';
import 'package:fish/service/treatment_service.dart';
import 'package:get/get.dart';

class TreatmentController extends GetxController {
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  var isLoading = false.obs;
  final listTreatment = <Treatment>[].obs;

  @override
  void onInit() async {
    await getTreatmentData(activation_id: '62d3f2180d7265ab60f9cb83');
    super.onInit();
  }

  // @override
  // void onReady() async {
  //   await getStatisticData();
  //   super.onReady();
  // }

  // Future<void> getTreatmentData() async {
  //   isLoading.value = true;
  //   listTreatment.clear();
  //   Treatment feedHistoryMonthly = await TreatmentService().getTreatmentList();
  //   listTreatment.addAll(feedHistoryMonthly);
  //   isLoading.value = false;
  // }

  Future<void> getTreatmentData({required String activation_id}) async {
    isLoading.value = true;
    listTreatment.clear();
    List<Treatment> treatmentData = await TreatmentService()
        .getTreatmentList(activationId: '62d3f2180d7265ab60f9cb83');
    listTreatment.addAll(treatmentData);
    // print(listTreatment.value);
    isLoading.value = false;
  }
}

// class TreatmentList {
//   TreatmentList(this.id, this.date, this.type);
//   final String id;
//   final String date;
//   final String type;
// }

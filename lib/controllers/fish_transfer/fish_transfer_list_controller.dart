import 'dart:async';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/models/fish_transfer_model.dart';
import 'package:fish/service/fish_transfer_service.dart';

import 'package:fish/service/pond_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TransferController extends GetxController {
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  var isLoading = false.obs;
  final listTransfer = <FishTransfer>[].obs;

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

  Future<void> getTransfertData(BuildContext context) async {
    isLoading.value = true;
    listTransfer.clear();
    List<FishTransfer> transferData =
        await FishTransferService().getFishTransferList();

    for (var i in transferData) {
      if (i.destination_activation_id == activation.id ||
          i.origin_activation_id == activation.id) {
        print('treatment get test');
        listTransfer.add(i);
      }
    }
    print(listTransfer);
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

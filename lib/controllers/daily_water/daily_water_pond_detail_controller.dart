import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/activation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DailyWaterDetailPondController extends GetxController {
  final ActivationService service = ActivationService();

  var isLoading = false.obs;

  Pond pond = Get.arguments()['pond'];
  RxList activations = List<Activation>.empty().obs;
  var isPondActive = false.obs;

  Future getPondActivation(BuildContext context) async {
    isLoading.value = true;
    activations.clear();
    try {
      var result = await service.getActivations(pondId: pond.id.toString());

      for (var i in result) {
        activations.add(i);
        if (i.isFinish == false) {
          isPondActive.value = true;
        }
      }
      inspect(isPondActive.value);
    } catch (e) {
      //
    }
    isLoading.value = false;
  }

  // @override
  // void onInit() async {
  //   print("pond_id : ${pond.id}");
  //   getPondActivations(pondId: pond.id!);
  //   super.onInit();
  // }

  // Future<void> getPondActivations({required String pondId}) async {
  //   // isLoading.value = true;
  //   // List<Activation> activationsData =
  //   //     await ActivationService().getActivations(pondId: pondId);
  //   // activations.addAll(activationsData);
  //   // inspect(activations);
  //   // isLoading.value = false;
  //   isActivationLoading.value = true;
  //   activations.clear();
  //   try {
  //     var result = await service.getActivations(pondId: pond.id.toString());
  //     inspect(result);
  //     activations.addAll(result);
  //   } catch (e) {
  //     //
  //   }
  //   isActivationLoading.value = false;
  // }
}

import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/activation_service.dart';
import 'package:fish/service/logging_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailPondController extends GetxController {
  final ActivationService service = ActivationService();

  var isLoading = false.obs;

  Pond pond = Get.arguments['pond'];
  RxList activations = List<Activation>.empty().obs;
  late Activation activationData;
  var isPondActive = false.obs;

  Future getPondActivation(BuildContext context) async {
    isLoading.value = true;
    activations.clear();
    try {
      var result = await service.getActivations(pondId: pond.id.toString());
      activationData = result[0];
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

  late DateTime startTime;
  late DateTime endTime;
  final fitur = 'Detai Pond';

  @override
  void onClose() {
    update();
    postDataLog(fitur);
    super.onClose();
  }

  @override
  void onInit() {
    startTime = DateTime.now();
    print('ini on init');
    super.onInit();
  }

  void onReady() {
    print('onready');
    super.onReady();
  }

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
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

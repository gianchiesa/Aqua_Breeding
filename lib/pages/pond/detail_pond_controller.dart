import 'dart:async';
import 'dart:developer';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/activation_service.dart';
import 'package:get/get.dart';

class DetailPondController extends GetxController {
  final ActivationService service = ActivationService();

  var isLoading = false.obs;

  Pond pond = Get.arguments;
  final activations = <Activation>[].obs;

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

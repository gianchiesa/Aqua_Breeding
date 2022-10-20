import 'dart:async';

import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/activation_service.dart';
import 'package:get/get.dart';

class DetailPondController extends GetxController {
  var isLoading = false.obs;
  Pond pond = Get.arguments;
  final activations = <Activation>[].obs;

  @override
  void onInit() async {
    print("pond_id : ${pond.id}");
    getPondActivations(pondId: pond.id!);
    super.onInit();
  }

  Future<void> getPondActivations({required String pondId}) async {
    isLoading.value = true;
    activations.clear();
    List<Activation> activationsData =
        await ActivationService().getActivations(pondId: pondId);
    activations.addAll(activationsData);
    isLoading.value = false;
  }
}

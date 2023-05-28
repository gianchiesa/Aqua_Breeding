import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

class BreedController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  late DateTime startTime;
  late DateTime endTime;
  final fitur = 'Detai Activation';

  void onClose() {
    endTime = DateTime.now();
    super.onClose();
  }

  void onInit() {
    startTime = DateTime.now();
    super.onInit();
  }
}

import 'package:fish/models/treatment_model.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';

class TreatmentDetailController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  Treatment treatment = Get.arguments["treatment"];
  late DateTime startTime;
  late DateTime endTime;
  final fitur = 'Pond Treatment';

  void onClose() {
    endTime = DateTime.now();
    super.onClose();
  }

  void onInit() {
    startTime = DateTime.now();
    super.onInit();
  }
  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

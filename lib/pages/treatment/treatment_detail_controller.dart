import 'package:fish/models/treatment_model.dart';
import 'package:get/get.dart';

class TreatmentDetailController extends GetxController {
  var isLoading = false.obs;
  Treatment treatment = Get.arguments()["treatment"];

  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

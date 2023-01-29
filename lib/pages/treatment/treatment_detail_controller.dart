import 'package:fish/models/treatment_model.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';

class TreatmentDetailController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  Treatment treatment = Get.arguments()["treatment"];

  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

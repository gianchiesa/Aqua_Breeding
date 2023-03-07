import 'package:fish/models/fish_transfer_model.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';

class SortirDetailController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  FishTransfer sortir = Get.arguments()["sortir"];

  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

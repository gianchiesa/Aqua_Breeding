import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

class ConstantaEditController extends GetxController {
  Pond pond = Get.arguments()['pond'];
  Activation activation = Get.arguments()['activation'];
  var isLoading = false.obs;
}

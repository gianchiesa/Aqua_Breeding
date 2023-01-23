import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/treatment_model.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

class DailyWaterDetailController extends GetxController {
  var isLoading = false.obs;
  DailyWater dailyWater = Get.arguments();

  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

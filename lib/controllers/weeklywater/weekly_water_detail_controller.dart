import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

class WeeklyWaterDetailController extends GetxController {
  var isLoading = false.obs;
  WeeklyWater weeklyWater = Get.arguments()["weeklywater"];
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
}

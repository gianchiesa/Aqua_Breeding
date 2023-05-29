import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

import '../../service/logging_service.dart';

class WeeklyWaterDetailController extends GetxController {
  var isLoading = false.obs;
  WeeklyWater weeklyWater = Get.arguments["weeklywater"];
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Weekly Water Quality';
  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
    print(value);
  }

  @override
  void dispose() {
    postDataLog(fitur);
    super.dispose();
  }
}

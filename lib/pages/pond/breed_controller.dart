import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:get/get.dart';

import '../../service/logging_service.dart';

class BreedController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Detail Activation';

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

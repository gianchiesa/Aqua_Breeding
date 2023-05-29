import 'package:fish/models/fish_transfer_model.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';

import '../../service/logging_service.dart';

class SortirDetailController extends GetxController {
  var isLoading = false.obs;
  Activation activation = Get.arguments["activation"];
  Pond pond = Get.arguments["pond"];
  FishTransfer sortir = Get.arguments["sortir"];

  final DateTime startTime = DateTime.now();
  late DateTime endTime;
  final fitur = 'Fist Transfer(Sortir)';

  Future<void> postDataLog(String fitur) async {
    // print(buildJsonFish());
    bool value =
        await LoggingService().postLogging(startAt: startTime, fitur: fitur);
  }

  @override
  void dispose() {
    postDataLog(fitur);
    super.dispose();
  }
  // Activation activation = Get.arguments()["activation"];
  // Pond pond = Get.arguments()["pond"];
  // FishGrading fishGrading = Get.arguments()['fishGrading'];
}

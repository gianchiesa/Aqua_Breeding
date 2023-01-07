import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/fish_death_service.dart';
import 'package:get/get.dart';

class FishRecapController extends GetxController {
  final List<FishLiveData> charData = [
    FishLiveData(99, '11-01-2022', 'Lele'),
    FishLiveData(87, '12-01-2022', 'Lele'),
    FishLiveData(82, '13-01-2022', 'Nila Merah'),
    FishLiveData(80, '14-01-2022', 'Nila Merah'),
    FishLiveData(70, '15-01-2022', 'Nila Hitam'),
  ].obs;

  var isLoading = false.obs;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final list_fishDeath = <FishDeath>[].obs;

  @override
  void onInit() async {
    getFishDeaths(activation_id: activation.id!);
    super.onInit();
  }

  Future<void> getFishDeaths({required String activation_id}) async {
    isLoading.value = true;
    list_fishDeath.clear();
    List<FishDeath> feedHistoryMonthly =
        await FishDeathService().fetchFishDeaths(activationId: activation_id);
    list_fishDeath.addAll(feedHistoryMonthly);
    isLoading.value = false;
  }
}

class FishLiveData {
  FishLiveData(this.amount, this.date, this.type);
  final double amount;
  final String date;
  final String type;
}

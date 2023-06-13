import 'package:get/get.dart';

class FishTypeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "pilih ikan".obs;

  final listFish = ["lele", "nila merah", "nila hitam", "mas", "patin"].obs;

  void setSelected(String value) {
    selected.value = value;
  }
}

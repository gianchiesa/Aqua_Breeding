import 'package:get/get.dart';

class CarbonTypeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "tidak ada".obs;
  final listCarbon = ["tidak ada", "molase", "gula", "terigu"];

  void setSelected(String value) {
    selected.value = value;
  }
}

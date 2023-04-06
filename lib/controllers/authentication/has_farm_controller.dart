import 'package:get/get.dart';

class HasFarmController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "Sudah".obs;
  final listMethod = ["Sudah", "Belum"];

  void setSelected(String value) {
    selected.value = value;
  }
}

import 'package:get/get.dart';

class FarmListController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "Pilih Tempat Budidaya".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}

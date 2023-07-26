import 'package:get/get.dart';

class FeedSatuanController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "gram".obs;
  final listSatuan = ["gram", "kilogram"];

  void setSelected(String value) {
    selected.value = value;
  }
}

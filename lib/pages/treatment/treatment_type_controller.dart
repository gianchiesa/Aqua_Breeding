import 'package:get/get.dart';

class TypeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "ringan".obs;
  final listtreatment = ["ringan", "berat"];

  void setSelected(String value) {
    selected.value = value;
  }
}

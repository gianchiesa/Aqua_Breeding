import 'package:get/get.dart';

class ShapeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "persegi".obs;
  final listMaterial = ["persegi", "bundar"];

  void setSelected(String value) {
    selected.value = value;
  }
}

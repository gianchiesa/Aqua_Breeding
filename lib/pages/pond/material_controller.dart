import 'package:get/get.dart';

class MaterialController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "tanah".obs;
  final listMaterial = ["tanah", "terpal", "beton"];

  void setSelected(String value) {
    selected.value = value;
  }
}

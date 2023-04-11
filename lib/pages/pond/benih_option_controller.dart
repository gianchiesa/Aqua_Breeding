import 'package:get/get.dart';

class BenihOptionController extends GetxController {
  final selected = "1-2 cm".obs;
  final listBenih = ["1-2 cm", "2-3 cm", "3-4 cm"];

  void setSelected(String value) {
    selected.value = value;
  }
}

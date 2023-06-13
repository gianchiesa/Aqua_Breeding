import 'package:get/get.dart';

class BenihOptionController extends GetxController {
  final selected = "1-2 cm".obs;
  final listBenih = [
    "1-2 cm",
    "2-3 cm",
    "3-4 cm",
    "4-5 cm",
    "5-6 cm",
    "6-7 cm",
    "8-9 cm",
    "9-10 cm"
  ];

  void setSelected(String value) {
    selected.value = value;
  }
}

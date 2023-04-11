import 'package:get/get.dart';

class BreedOptionController extends GetxController {
  final selected = "Benih".obs;
  final listBreed = ["Benih", "Pembesaran"];

  void setSelected(String value) {
    selected.value = value;
  }
}

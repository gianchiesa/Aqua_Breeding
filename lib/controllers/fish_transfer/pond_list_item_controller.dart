import 'package:fish/controllers/fish_transfer/fish_transfer_entry_controller.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/service/pond_service.dart';
import 'package:get/get.dart';

class PondListController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "pilih kolam".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}

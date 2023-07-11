import 'package:get/get.dart';

import 'fish_transfer_entry_controller.dart';

class TransferTypeController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "oversized_transfer".obs;
  final listMethod = ["oversized_transfer", "undersized_transfer"];

  void setSelected(String value) {
    selected.value = value;
  }
}

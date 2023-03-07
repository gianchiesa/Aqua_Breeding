import 'package:get/get.dart';

import 'fish_transfer_entry_controller.dart';

class TransferMethodController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "basah".obs;
  final listMethod = ["kering", "basah"];

  void setSelected(String value) {
    selected.value = value;
    FishTransferEntryController().getPondsData(selected.toString());
  }
}

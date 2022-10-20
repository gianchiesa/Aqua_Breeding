import 'package:fish/models/feed_type_model.dart';
import 'package:fish/service/feed_type_service.dart';
import 'package:get/get.dart';

class FeedTypeFormController extends GetxController {
  // It is mandatory initialize with one value from listType
  final selected = "".obs;
  final listFeedType = <FeedType>[].obs;

  void setSelected(String value) {
    selected.value = value;
  }

  Future<void> getData() async {
    listFeedType.clear();
    List<FeedType> feedtypes = await FeedTypeService().fetchFeedType();
    listFeedType.addAll(feedtypes);
    setSelected(listFeedType[0].name!);
    super.onInit();
  }

  String? getIdByName() {
    print(selected);
    for (FeedType feedType in listFeedType) {
      if (feedType.name == selected.value) {
        return feedType.id;
      }
    }
    return null;
  }
}

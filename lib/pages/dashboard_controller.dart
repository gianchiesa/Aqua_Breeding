import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;
  var initializeTime = DateTime.now();

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}

import 'dart:async';

import 'package:fish/pages/dashboard.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loading();
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      Get.off(const DashboardPage());
    });
  }
}

import 'dart:async';

import 'package:fish/models/statistic_model.dart';
import 'package:fish/service/statistic_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  final statistic = StatisticModel().obs;

  @override
  void onInit() async {
    await getStatisticData();
    super.onInit();
  }

  // @override
  // void onReady() async {
  //   await getStatisticData();
  //   super.onReady();
  // }

  Future<void> getStatisticData() async {
    isLoading.value = true;
    StatisticModel statisticData = await StatisticService().getStatistic();
    statistic.value = statisticData;
    Timer(const Duration(seconds: 1), () {
      isLoading.value = false;
    });
  }
}

import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:fish/pages/pond/detail_breed_page.dart';
import 'package:fish/pages/treatment/treatment_page.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/pages/pond/detail_pond_page.dart';

import 'package:fish/pages/dailywater/daily_water_pond_detail_page.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MyTabsPond extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;

  late TabController controller;
  Pond pond = Get.arguments["pond"];
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Musim Budidaya',
    ),
    Tab(
      text: 'Kondisi Air',
    )
  ];

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      if (controller.indexIsChanging) {
        if (controller.previousIndex == 0) {
          Get.delete<DetailPondController>();
          Get.put(DailyWaterBreedListController());
        } else {
          Get.delete<DailyWaterBreedListController>();
          Get.put(DetailPondController());
        }
      }
      // Tab Changed tapping on new tab
    });
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}

class MyTabPondScreen extends StatelessWidget {
  MyTabPondScreen({Key? key}) : super(key: key);
  final pondController = Get.put(PondController());
  @override
  Widget build(BuildContext context) {
    final MyTabsPond _tabs = Get.put(MyTabsPond());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: const Text('Detail Kolam'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: _tabs.myTabs,
          controller: _tabs.controller,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            // Get.back();

            Navigator.pop(context);

            pondController.getPondsData(context);
          },
        ),
      ),
      body: TabBarView(
        controller: _tabs.controller,
        children: [DetailPondPage(), DailyWaterDetailPondPage()],
      ),
    );
  }
}

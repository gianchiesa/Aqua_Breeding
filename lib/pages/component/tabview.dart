import 'package:fish/pages/pond/detail_breed_page.dart';
import 'package:fish/pages/treatment/treatment_page.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';

class MyTabs extends GetxController with GetSingleTickerProviderStateMixin {
  var isLoading = false.obs;
  late TabController controller;
  Activation activation = Get.arguments()["activation"];
  Pond pond = Get.arguments()["pond"];
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Rekap Data',
    ),
    Tab(
      text: 'Treatment',
    )
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    controller.dispose();
    super.onClose();
  }
}

class MyTabScreen extends StatelessWidget {
  const MyTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyTabs _tabs = Get.put(MyTabs());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: const Text('Detail Musim Budidaya'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: _tabs.myTabs,
          controller: _tabs.controller,
        ),
      ),
      body: TabBarView(
        controller: _tabs.controller,
        children: [DetailBreedPage(), TreatmentpPage()],
      ),
    );
  }
}

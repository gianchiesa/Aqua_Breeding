import 'package:fish/controllers/fish_transfer/fish_transfer_list_controller.dart';
import 'package:fish/pages/pond/breed_controller.dart';
import 'package:fish/pages/pond/detail_breed_page.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:fish/pages/treatment/treatment_page.dart';
import 'package:fish/pages/fish_transfer/fish_transfer_list_page.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';

class MyTabs extends GetxController with GetSingleTickerProviderStateMixin {
  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();

  var isLoading = false.obs;

  late TabController controller;
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'Rekap Data',
    ),
    Tab(
      text: 'Treatment',
    ),
    Tab(
      text: 'Riwayat Sortir',
    )
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      if (controller.indexIsChanging) {
        if (controller.previousIndex == 0) {
          Get.delete<BreedController>();
          if (controller.index == 1) {
            Get.put(TreatmentController());
          } else {
            Get.put(TransferController());
          }
        } else if (controller.previousIndex == 1) {
          Get.delete<TreatmentController>();
          if (controller.index == 0) {
            Get.put(BreedController());
          } else {
            Get.put(TransferController());
          }
        } else {
          Get.delete<TransferController>();
          if (controller.index == 0) {
            Get.put(BreedController());
          } else {
            Get.put(TreatmentController());
          }
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

class MyTabScreen extends StatelessWidget {
  MyTabScreen({Key? key}) : super(key: key);

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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () async {
            // Get.back();

            Navigator.pop(context);
          },
        ),
      ),
      body: TabBarView(
        controller: _tabs.controller,
        children: [DetailBreedPage(), TreatmentpPage(), FishTransferListPage()],
      ),
    );
  }
}

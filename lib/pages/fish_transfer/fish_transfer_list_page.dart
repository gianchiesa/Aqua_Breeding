import 'package:fish/pages/component/transfer_card.dart';
import 'package:fish/controllers/fish_transfer/fish_transfer_list_controller.dart';
import 'package:fish/pages/fish_transfer/fish_transfer_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import 'new_fish_transfer_entry_page.dart';

class FishTransferListPage extends StatefulWidget {
  FishTransferListPage({Key? key}) : super(key: key);

  @override
  State<FishTransferListPage> createState() => _FishTransferListPageState();
}

class _FishTransferListPageState extends State<FishTransferListPage> {
  final TransferController controller = Get.put(TransferController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getTransfertData(context);
  }

  @override
  void dispose() {
    controller.postDataLog(controller.fitur);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget fishDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kolam ${controller.pond.alias.toString()}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget listTransfer() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.listTransfer
                .map(
                  (transferList) => TransferCard(
                      transferList: transferList,
                      activation: controller.activation,
                      pond: controller.pond),
                )
                .toList(),
          ));
    }

    Widget emptyListTransfer() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(height: 35),
              Image(
                image: AssetImage("assets/unavailable_icon.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20),
              Text(
                "Kolam belum pernah melakukan transfer ikan",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan masukan transfer ikan",
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => const NewFishTransferEntryPage(), arguments: {
                "pond": controller.pond,
                "activation": controller.activation
              });
              controller.postDataLog(controller.fitur);
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              controller.listTransfer.isEmpty
                  ? emptyListTransfer()
                  : listTransfer(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );
      }
    });
  }
}

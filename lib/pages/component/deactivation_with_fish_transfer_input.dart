import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../../controllers/fish_transfer/fish_transfer_entry_controller.dart';

class FishTransferDeactivationListCard extends StatelessWidget {
  final Fish fish;

  FishTransferDeactivationListCard({Key? key, required this.fish})
      : super(key: key);
  final FishTransferEntryController controller =
      Get.put(FishTransferEntryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin / 2,
      ),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                fish.type!,
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                style: primaryTextStyle,
                controller: fish.type! == "lele"
                    ? controller.leleAmountDeactivationController
                    : fish.type! == "patin"
                        ? controller.patinAmountDeactivationController
                        : fish.type! == "nila hitam"
                            ? controller.nilaHitamAmountDeactivationController
                            : fish.type == "nila merah"
                                ? controller
                                    .nilaMerahAmountDeactivationController
                                : controller.masAmountDeactivationController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Jumlah Ikan (Ekor)',
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                style: primaryTextStyle,
                controller: fish.type! == "lele"
                    ? controller.leleWeightDeactivationController
                    : fish.type! == "patin"
                        ? controller.patinWeightDeactivationController
                        : fish.type! == "nila hitam"
                            ? controller.nilaHitamWeightDeactivationController
                            : fish.type == "nila merah"
                                ? controller
                                    .nilaMerahWeightDeactivationController
                                : controller.masWeightDeactivationController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Total Berat Ikan (Kg)',
                  hintStyle: subtitleTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

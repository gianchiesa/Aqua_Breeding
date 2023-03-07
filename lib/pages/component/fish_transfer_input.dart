import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/treatment/treatment_entry_controller.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/fish_transfer/fish_transfer_entry_controller.dart';

class FishTransferInputCard extends StatelessWidget {
  final Fish fish;

  FishTransferInputCard({Key? key, required this.fish}) : super(key: key);
  final FishTransferEntryController controller =
      Get.put(FishTransferEntryController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin / 2,
      ),
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
              SizedBox(
                width: 6,
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                style: primaryTextStyle,
                controller: fish.type! == "lele"
                    ? controller.leleAmountController
                    : fish.type! == "patin"
                        ? controller.patinAmountController
                        : fish.type! == "nila hitam"
                            ? controller.nilaHitamAmountController
                            : fish.type == "nila merah"
                                ? controller.nilaMerahAmountController
                                : controller.masAmountController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Jumlah Ikan (Ekor)',
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

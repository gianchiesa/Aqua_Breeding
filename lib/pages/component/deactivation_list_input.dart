import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/pond/deactivation_breed_controller.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class DeactivationListCard extends StatelessWidget {
  final Fish fish;

  DeactivationListCard({Key? key, required this.fish}) : super(key: key);
  final DeactivationBreedController controller =
      Get.put(DeactivationBreedController());

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
              SizedBox(
                width: 6,
              ),
              Text(
                "${fish.amount.toString()} Ekor",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
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
                    ? controller.leleWeightController
                    : fish.type! == "patin"
                        ? controller.patinWeightController
                        : fish.type! == "nila hitam"
                            ? controller.nilaHitamWeightController
                            : fish.type == "nila merah"
                                ? controller.nilaMerahWeightController
                                : controller.masWeightController,
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

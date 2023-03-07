import 'package:fish/models/fish_harvested.dart';
import 'package:fish/models/fish_transfer_model.dart';
import 'package:fish/controllers/fish_transfer/fish_transfer_list_controller.dart';
// import 'package:fish/pages/treatment/treatment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:fish/models/fish_transfer_model.dart';

import 'package:fish/models/pond_model.dart';

import 'package:fish/models/activation_model.dart';

class FishList extends StatelessWidget {
  final String? amount;
  final String? type;
  const FishList({Key? key, this.amount, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => DetailTreatmentPage(), arguments: {
        //   "treatment": treatmentList,
        //   "activation": activation,
        //   "pond": pond,
        // });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${type} : ${amount}",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

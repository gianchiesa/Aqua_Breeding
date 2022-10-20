import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/grading/detail_grading_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class GradingCard extends StatelessWidget {
  final Activation? activation;
  final Pond? pond;
  final FishGrading? fishGrading;

  const GradingCard({
    Key? key,
    this.activation,
    this.pond,
    this.fishGrading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailGradingPage(), arguments: {
          "activation": activation,
          "pond": pond,
          "fishGrading": fishGrading,
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
          color: transparentColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        fishGrading!.getDate(),
                        style: secondaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bobot Rata Rata",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        '${fishGrading!.avgFishWeight} gram',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jumlah Sample",
                        style: primaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "${fishGrading!.samplingAmount}/100 Ekor",
                        style: secondaryTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dailywater/daily_water_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';

class DailyWaterCard extends StatelessWidget {
  final DailyWater? dailyWaterList;
  final Activation? activation;
  final Pond? pond;
  const DailyWaterCard(
      {Key? key, this.dailyWaterList, this.activation, this.pond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DailyWaterDetailPage(), arguments: {
          "dailywater": dailyWaterList,
          "activation": activation,
          "pond": pond,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      dailyWaterList!.getDayNameDate(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      dailyWaterList!.getGmtToNormalDate(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "pH",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      dailyWaterList!.ph_desc.toString(),
                      style: secondaryTextStyle.copyWith(
                        color: dailyWaterList!.ph_desc == "normal"
                            ? Colors.green
                            : Colors.red.shade300,
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Do",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      dailyWaterList!.numDo_desc.toString(),
                      style: secondaryTextStyle.copyWith(
                        color: dailyWaterList!.numDo_desc == "normal"
                            ? Colors.green
                            : dailyWaterList!.numDo_desc == "berbahaya"
                                ? Colors.red.shade300
                                : Colors.amber,
                        fontSize: 14,
                        fontWeight: medium,
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

import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dailywater/daily_water_detail_page.dart';

import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';

class DailyWaterCard extends StatelessWidget {
  final DailyWater? dailyWater;
  final Activation? activation;
  final Pond? pond;
  final DailyWaterController water = Get.put(DailyWaterController());
  DailyWaterCard({Key? key, this.dailyWater, this.activation, this.pond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DailyWaterController dailyWaterController = Get.find();
    return GestureDetector(
      onTap: () {
        dailyWaterController.updateSelectedDailyWater(dailyWater!.id);
        Get.to(() => DailyWaterDetailPage(), arguments: {
          "dailywater": dailyWater,
          "activation": activation,
          "pond": pond,
        });
        water.postDataLog('Daily Water Quality');
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
                      dailyWater!.getDayNameDate(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      dailyWater!.getGmtToNormalDate(),
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
                      dailyWater!.ph.toString(),
                      style: secondaryTextStyle.copyWith(
                        color: dailyWater!.ph_desc == "normal"
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
                      dailyWater!.numDo.toString(),
                      style: secondaryTextStyle.copyWith(
                        color: dailyWater!.numDo_desc == "normal"
                            ? Colors.green
                            : dailyWater!.numDo_desc == "berbahaya"
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

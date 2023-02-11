import 'package:fish/models/weeklywater_model.dart';
import 'package:fish/models/pond_model.dart';

import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../../models/activation_model.dart';
import '../weeklywater/weeklywater_detail_page.dart';

class WeeklyWaterCard extends StatelessWidget {
  final WeeklyWater? weeklyWaterList;
  final Activation? activation;
  final Pond? pond;
  const WeeklyWaterCard(
      {Key? key, this.weeklyWaterList, this.activation, this.pond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => WeeklyWaterDetailPage(), arguments: {
          "weeklywater": weeklyWaterList,
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
                      weeklyWaterList!.getDayNameDate(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      weeklyWaterList!.getGmtToNormalDate(),
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
                      "floc",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      weeklyWaterList!.floc_desc.toString(),
                      style: secondaryTextStyle.copyWith(
                        color: weeklyWaterList!.floc_desc == "normal"
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 80,
                      // margin: EdgeInsets.only(
                      //     top: defaultMargin,
                      //     right: defaultMargin,
                      //     left: defaultMargin),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Detail',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    )
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

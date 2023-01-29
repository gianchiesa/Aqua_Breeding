import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/dailywater/daily_water_pond_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../pond/detail_pond_page.dart';

class DailyWaterListPondCard extends StatelessWidget {
  final Pond pond;
  // final DailyWater indicatorWater

  const DailyWaterListPondCard({
    Key? key,
    required this.pond,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DailyWaterDetailPondPage(), arguments: {
          'pond': pond,
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pond.alias!,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: pond.getColor(),
                  ),
                  child: Center(
                    child: Text(
                      pond.pondStatusStr!,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: heavy,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
            Divider(color: Colors.black),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    'pH:',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // pond.id == indicatorWater.pondId
                  //     ? Text(
                  //         "${indicatorWater.ph} " + "${indicatorWater.ph_desc}",
                  //         style: subtitleTextStyle.copyWith(
                  //           color: indicatorWater.ph_desc == "normal"
                  //               ? Colors.green
                  //               : Colors.red.shade300,
                  //           fontSize: 16,
                  //           fontWeight: bold,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                  //     : Text(
                  //         'Belum Diukur',
                  //         style: subtitleTextStyle.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: regular,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    'Do:',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // pond.id == indicatorWater.pondId
                  //     ? Text(
                  //         "${indicatorWater.numDo} " +
                  //             "${indicatorWater.numDo_desc}",
                  //         style: subtitleTextStyle.copyWith(
                  //           color: indicatorWater.numDo_desc == "normal"
                  //               ? Colors.green
                  //               : indicatorWater.numDo_desc == "berbahaya"
                  //                   ? Colors.red.shade300
                  //                   : Colors.amber,
                  //           fontSize: 16,
                  //           fontWeight: bold,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                  //     : Text(
                  //         'Belum Diukur',
                  //         style: subtitleTextStyle.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: regular,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    'Suhu:',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // pond.id == indicatorWater.pondId
                  //     ? Text(
                  //         "${indicatorWater.temperature} " + "°C",
                  //         style: subtitleTextStyle.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: bold,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                  //     : Text(
                  //         'Belum Diukur',
                  //         style: subtitleTextStyle.copyWith(
                  //           fontSize: 16,
                  //           fontWeight: regular,
                  //         ),
                  //         overflow: TextOverflow.ellipsis,
                  //         maxLines: 1,
                  //       )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

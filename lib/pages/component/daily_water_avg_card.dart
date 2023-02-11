import 'package:fish/models/daily_water_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:fish/pages/dailywater/daily_water_detail_page.dart';

import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:fish/models/treatment_model.dart';

import '../../models/activation_model.dart';

class DailyWaterCardAvg extends StatelessWidget {
  final Map<String, dynamic> sol;
  const DailyWaterCardAvg({Key? key, required this.sol}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  "Minggu ke - ${sol['week']}",
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Divider(color: Colors.black),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "pH rata-rata:",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    sol['ph'].toString(),
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "Do rata-rata :",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    sol['numDo'].toStringAsFixed(1),
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    "Suhu rata-rata:",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${sol['temperature'].toStringAsFixed(1)} °C",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: heavy,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

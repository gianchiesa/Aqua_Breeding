import 'package:flutter/material.dart';
import 'package:fish/theme.dart';

class WeeklyWaterCardAvg extends StatelessWidget {
  final Map<String, dynamic> sol;
  const WeeklyWaterCardAvg({Key? key, required this.sol}) : super(key: key);

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
                    "floc rata-rata:",
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
                    sol['floc'].toString(),
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
                    "Nitrite rata-rata :",
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
                    sol['nitrite'].toStringAsFixed(1),
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
                    "Nitrate rata-rata:",
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
                    sol['nitrate'].toStringAsFixed(1),
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
                    "Ammonia rata-rata:",
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
                    sol['ammonia'].toStringAsFixed(1),
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
                    "Hardness rata-rata:",
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
                    sol['hardness'].toStringAsFixed(1),
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

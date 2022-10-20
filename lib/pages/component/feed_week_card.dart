import 'package:fish/models/FeedHistoryMonthly.dart';
import 'package:fish/models/FeedHistoryWeekly.dart';
import 'package:fish/models/activation_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/feeding/detail_feed_weekly_page.dart';
import 'package:flutter/material.dart';

import 'package:fish/theme.dart';
import 'package:get/get.dart';

class FeedWeeklyCard extends StatelessWidget {
  final Activation? activation;
  final Pond? pond;
  final FeedHistoryMonthly? feedHistoryMonthly;
  final FeedHistoryWeekly? feedHistoryWeekly;

  const FeedWeeklyCard({
    Key? key,
    this.activation,
    this.pond,
    this.feedHistoryMonthly,
    this.feedHistoryWeekly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailFeedWeeklyPage(), arguments: {
          "activation": activation,
          "pond": pond,
          "feedHistoryMonthly": feedHistoryMonthly,
          "feedHistoryWeekly": feedHistoryWeekly
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
                      "Minggu Ke-",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      feedHistoryWeekly!.week.toString(),
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
                      "Pakan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "${feedHistoryWeekly!.totalFeedWeight} Kg",
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
                      "Total Pemberian",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "${feedHistoryWeekly!.totalFeed} Kali",
                      style: secondaryTextStyle.copyWith(
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

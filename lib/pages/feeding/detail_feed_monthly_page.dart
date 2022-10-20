import 'package:fish/pages/component/feed_week_card.dart';
import 'package:fish/pages/feeding/feed_monthly_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class DetailFeedMonthlyPage extends StatelessWidget {
  const DetailFeedMonthlyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedMonthlyController controller = Get.put(FeedMonthlyController());

    Widget feedMonthlyDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "kolam ${controller.pond.alias}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Bulan ${controller.feedHistoryMonthly.getMonthNameFull()}",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Widget entryPakanButton() {
    //   return Container(
    //     height: 50,
    //     width: double.infinity,
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: TextButton(
    //       onPressed: () {},
    //       style: TextButton.styleFrom(
    //         backgroundColor: Colors.green.shade400,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(12),
    //         ),
    //       ),
    //       child: Text(
    //         'Entry Pakan',
    //         style: primaryTextStyle.copyWith(
    //           fontSize: 16,
    //           fontWeight: medium,
    //         ),
    //       ),
    //     ),
    //   );
    // }

    Widget detail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lokasi Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Blok A",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  " ",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Total Pemberian Pakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "30 Kali",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
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
                  "Jumlah Ikan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Lele: 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "Nila Merah: 100 Ekor",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Total Pakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "30 Kg",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget recapTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
        child: Text(
          "Rekapitulasi Pakan Mingguan",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    // Widget chartRecap() {
    //   return Container(
    //     width: double.infinity,
    //     margin: EdgeInsets.only(
    //         top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
    //     // decoration: BoxDecoration(
    //     //     image: DecorationImage(image: AssetImage('assets/feedChart.png'))),
    //   );
    // }

    Widget listWeeklyFeed() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.list_feedHistoryWeekly
                .map(
                  (feedHistoryWeekly) => FeedWeeklyCard(
                      activation: controller.activation,
                      pond: controller.pond,
                      feedHistoryMonthly: controller.feedHistoryMonthly,
                      feedHistoryWeekly: feedHistoryWeekly),
                )
                .toList(),
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Detail Pakan Bulanan"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              feedMonthlyDataRecap(),
              // detail(),
              recapTitle(),
              // chartRecap(),
              listWeeklyFeed(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        );
      }
    });
  }
}

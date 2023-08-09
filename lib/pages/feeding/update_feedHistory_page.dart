import 'package:fish/pages/feeding/feed_controller.dart';
import 'package:fish/pages/feeding/feed_daily_controller.dart';
import 'package:fish/pages/feeding/feed_monthly_controller.dart';
import 'package:fish/pages/feeding/feed_weekly_controller.dart';
import 'package:fish/pages/feeding/udpate_feedhistory_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class UpdateFeedHistory extends StatelessWidget {
  const UpdateFeedHistory({super.key});

  @override
  Widget build(BuildContext context) {
    DetailPondController detailPondController = Get.find();
    FeedController feedController = Get.find();
    FeedMonthlyController feedMonthlyController = Get.find();
    FeedWeeklyController feedWeeklyController = Get.find();
    FeedDailyController feedDailyController = Get.find();
    final controller = Get.put(UpdateFeedHistoryController());

    Widget doseInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dosis Pakan (Kg)',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  controller: controller.doseController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 20',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            await controller.editFeedHistory();
            // update chartfeed
            await feedController.getChartFeed(
                activation_id: detailPondController.selectedActivation.value.id
                    .toString());
            // update list monthly
            await feedController.updateListandFeedHistoryMonthly();
            // update list weekly
            await feedMonthlyController.updateListandFeedHistoryWeekly();
            // update list daily
            await feedWeeklyController.updateListandFeedHistoryDaily();
            // update list hourly
            await feedDailyController.updateListandFeedHistoryHourly();
            Get.back();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Submit',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Edit Kondisi Air Harian"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              doseInput(),
              submitButton(),
              SizedBox(
                height: 8,
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

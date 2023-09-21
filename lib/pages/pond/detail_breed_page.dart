import 'package:fish/models/fish_live_model.dart';
import 'package:fish/models/fishchart_model.dart';
import 'package:fish/pages/component/fish_list_card.dart';
import 'package:fish/pages/component/fish_harvest_card.dart';
import 'package:fish/pages/dailywater/daily_water_edit_page.dart';
import 'package:fish/pages/pond/add_fish_page.dart';
import 'package:fish/pages/pond/breed_controller.dart';
import 'package:fish/pages/grading/grading_page.dart';
import 'package:fish/pages/feeding/detail_feed_page.dart';

import 'package:fish/pages/fish/fish_recap_page.dart';
import 'package:fish/pages/pond/edit_fish_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'detail_pond_controller.dart';

class DetailBreedPage extends StatelessWidget {
  const DetailBreedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BreedController controller = Get.put(BreedController());
    final DetailPondController detailPondController =
        Get.put(DetailPondController());

    Widget breedDataRecap() {
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
                  "Kolam ${controller.pondController.selectedPond.value.alias}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: heavy,
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

    // Widget feedEntryButton() {
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

    Widget editButton() {
      return Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            // Get.to(() => DailyWaterEditPage(), arguments: {
            //   'pond': controller.pondController.selectedPond.value,
            //   'activation': controller.detailPondController.selectedActivation.value,
            // });
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(300, 40),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Edit Data',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget addFishButton() {
      return Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: defaultSpace),
        child: TextButton(
          onPressed: () {
            Get.to(() => AddFish(), arguments: {
              'pond': controller.pondController.selectedPond.value,
              'activation':
                  controller.detailPondController.selectedActivation.value,
            });
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(300, 40),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Tambah Ikan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget editFishButton() {
      return Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: defaultSpace),
        child: TextButton(
          onPressed: () {
            Get.to(() => EditFish());
          },
          style: TextButton.styleFrom(
            fixedSize: const Size(300, 40),
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Edit Jumlah Ikan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget feedButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => DetailFeedPage(), arguments: {
              "pond": controller.pondController.selectedPond.value,
              "activation":
                  controller.detailPondController.selectedActivation.value,
            });
            controller.postDataLog(controller.fitur);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Rekapitulasi Pakan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget gradingButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => GradingPage(), arguments: {
              "pond": controller.pondController.selectedPond.value,
              "activation":
                  controller.detailPondController.selectedActivation.value,
            });
            controller.postDataLog(controller.fitur);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Rekapitulasi Grading',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget deathButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => FishRecapPage(), arguments: {
              "pond": controller.pondController.selectedPond.value,
              "activation":
                  controller.detailPondController.selectedActivation.value,
            });
            controller.postDataLog(controller.fitur);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Rekapitulasi Kematian',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget detail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: primaryColor),
                color: transparentColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masa Budidaya (${controller.detailPondController.selectedActivation.value.getStatus()})",
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Divider(color: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mulai",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        controller.detailPondController.selectedActivation.value
                            .getStringActivationDate(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Panen",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        controller.detailPondController.selectedActivation.value
                            .getStringDeactivationDate(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Masa Budidaya",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "${controller.detailPondController.selectedActivation.value.getRangeActivation().toString()} Hari",
                        style: purpleTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    Widget fishInfo() {
      return Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: primaryColor),
              color: transparentColor,
            ),
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah Ikan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Divider(color: Colors.white),
                Column(
                  children: controller.detailPondController.selectedActivation
                              .value.isFinish ==
                          false
                      ? controller.detailPondController.selectedActivation.value
                          .fishLive!
                          .map(
                            (fish) => FishListCard(fish: fish),
                          )
                          .toList()
                      : controller.detailPondController.selectedActivation.value
                          .fishHarvested!
                          .map(
                            (fish) => FishHarvestCard(fish: fish),
                          )
                          .toList(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Ikan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "${controller.detailPondController.selectedActivation.value.fishAmount.toString()} Ekor",
                      style: purpleTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Bobot",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      detailPondController
                              .selectedActivation.value.totalWeightFishAlive!
                              .toStringAsFixed(2) +
                          ' Kg',
                      style: purpleTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                // controller.detailPondController.selectedActivation.value
                //             .isFinish ==
                //         false
                //     ? addFishButton()
                //     : Container(),
                controller.detailPondController.selectedActivation.value
                            .isFinish ==
                        false
                    ? editFishButton()
                    : Container(),
              ],
            ),
          ),
          SizedBox(height: 30)
        ],
      );
    }

    Widget feedhistoryinfo() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
          color: transparentColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailPondController.selectedActivation.value
                          .getRangeActivation()
                          .toString() +
                      " Hari Masa Budidaya",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Pakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailPondController.selectedActivation.value.feedDose
                          .toString() +
                      " Kg",
                  style: purpleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
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

    Widget fishChart() {
      return Container(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          title: ChartTitle(
              text: 'Chart Ikan Hidup',
              textStyle: TextStyle(color: Colors.white)),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.white)),
          primaryXAxis: CategoryAxis(
              interval: 1,
              labelPlacement: LabelPlacement.onTicks,
              labelRotation: 90,
              labelStyle: TextStyle(color: Colors.white),
              autoScrollingDelta: 10),
          primaryYAxis: NumericAxis(
              // maximum: 100,
              // minimum: 0,
              labelStyle: TextStyle(color: Colors.white)),
          series: <ChartSeries>[
            LineSeries<FishChartData, dynamic>(
                enableTooltip: true,
                color: Colors.blue,
                dataSource: controller.charData,
                xValueMapper: (FishChartData fish, _) => fish.date,
                yValueMapper: (FishChartData fish, _) => fish.amount,
                name: 'Ikan Hidup')
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
          "Menu Rekapitulasi Budidaya",
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget finishBreed() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rating Musim Budidaya",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: primaryColor),
                  color: transparentColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Food Conversion Rate",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        controller
                            .detailPondController.selectedActivation.value.fcr!
                            .toStringAsFixed(3),
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
                    children: [
                      Text(
                        "Survival Rate",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "${controller.detailPondController.selectedActivation.value.survivalRate!.toStringAsFixed(2)} %",
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
            ),
          ],
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
    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              breedDataRecap(),
              detail(),
              fishInfo(),
              feedhistoryinfo(),
              // fishChart(),
              controller.detailPondController.selectedActivation.value
                          .isFinish ==
                      false
                  ? Container()
                  : finishBreed(),
              recapTitle(),
              feedButton(),
              gradingButton(),
              deathButton(),
              // listMonthFeed(),
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

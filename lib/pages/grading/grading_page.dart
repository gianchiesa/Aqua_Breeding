import 'dart:async';

import 'package:fish/models/grading_chart_model.dart';
import 'package:fish/pages/component/grading_card.dart';
import 'package:fish/pages/grading/grading_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/grading/grading_constanta_edit_page.dart';
import 'package:fish/pages/grading/grading_entry_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GradingPage extends StatelessWidget {
  const GradingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GradingController controller = Get.put(GradingController());

    Widget chartGrading() {
      return Container(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          title: ChartTitle(
              text: 'Pertumbuhan Ikan dan Pakan',
              textStyle: TextStyle(color: Colors.white)),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.white)),
          primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(color: Colors.white),
              autoScrollingDelta: 4),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}Kg',
              labelStyle: TextStyle(color: Colors.white)),
          series: <ChartSeries>[
            SplineAreaSeries<FishWeightData, dynamic>(
              enableTooltip: true,
              color: Colors.blue.withOpacity(0.3), // Warna area di bawah garis
              borderWidth: 2, // Lebar garis biru
              borderColor: Colors.blue, // Warna garis biruna garis biru
              dataSource: controller.fishGradingChart!.value.listFishWeight,
              xValueMapper: (FishWeightData fishWeightData, _) =>
                  fishWeightData.getDate(),
              yValueMapper: (FishWeightData fishWeightData, _) =>
                  fishWeightData.totalWeightFish,
              markerSettings: MarkerSettings(
                isVisible: true, // Menampilkan marker
                shape: DataMarkerType.circle, // Bentuk marker
              ),
              name: 'Bobot Ikan',
            ),
            SplineAreaSeries<FishFeedHistory, dynamic>(
              enableTooltip: true,
              color: Colors.pink.withOpacity(0.3),
              borderWidth: 2, // Lebar garis biru
              borderColor: Colors.pink, //
              dataSource:
                  controller.fishGradingChart!.value.listFishFeedHistory,
              xValueMapper: (FishFeedHistory fishFeedHistory, _) =>
                  fishFeedHistory.getDate(),
              yValueMapper: (FishFeedHistory fishFeedHistory, _) =>
                  fishFeedHistory.totalFeedDose,
              markerSettings: MarkerSettings(
                isVisible: true, // Menampilkan marker
                shape: DataMarkerType.circle, // Bentuk marker
              ),
              name: 'Total Pakan',
            ),
          ],
        ),
      );
    }

    Widget emptyChartGrading() {
      return Container(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          title: ChartTitle(
              text: 'Rekap Grading', textStyle: TextStyle(color: Colors.white)),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.white)),
          primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(color: Colors.white),
              autoScrollingDelta: 4),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}Kg',
              labelStyle: TextStyle(color: Colors.white)),
          series: <ChartSeries>[
            SplineAreaSeries<FishWeightData, dynamic>(
              enableTooltip: true,
              color: Colors.blue.withOpacity(0.3), // Warna area di bawah garis
              borderWidth: 2, // Lebar garis biru
              borderColor: Colors.blue, // Warna garis biruna garis biru
              dataSource: [],
              xValueMapper: (FishWeightData fishWeightData, _) =>
                  fishWeightData.getDate(),
              yValueMapper: (FishWeightData fishWeightData, _) =>
                  fishWeightData.totalWeightFish,
              markerSettings: MarkerSettings(
                isVisible: true, // Menampilkan marker
                shape: DataMarkerType.circle, // Bentuk marker
              ),
              name: 'Bobot Ikan',
            ),
            SplineAreaSeries<FishFeedHistory, dynamic>(
              enableTooltip: true,
              color: Colors.pink.withOpacity(0.3),
              borderWidth: 2, // Lebar garis biru
              borderColor: Colors.pink, //
              dataSource: [],
              xValueMapper: (FishFeedHistory fishFeedHistory, _) =>
                  fishFeedHistory.getDate(),
              yValueMapper: (FishFeedHistory fishFeedHistory, _) =>
                  fishFeedHistory.totalFeedDose,
              markerSettings: MarkerSettings(
                isVisible: true, // Menampilkan marker
                shape: DataMarkerType.circle, // Bentuk marker
              ),
              name: 'Total Pakan',
            ),
          ],
        ),
      );
    }

    Widget gradingDataRecap() {
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
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget entryGradingButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => const GradingEntryPage(), arguments: {
              "pond": controller.pond,
              "activation": controller.activation
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
            'Entry Grading',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget emptyListPond() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(height: 35),
              Image(
                image: AssetImage("assets/unavailable_icon.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20),
              Text(
                "Anda belum pernah melakukan entry grading",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan Lakukan Entry Grading",
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
          ));
    }

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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Musim Budidaya",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "12-09-2022 sampai 01-19-2022",
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
          "Rekapitulasi Grading",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget emptyListActivation() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(height: 35),
              Image(
                image: AssetImage("assets/unavailable_icon.png"),
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: 20),
              Text(
                "Kolam belum pernah\nMelakukan grading",
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text(
                "Silahkan melakukan grading!",
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ]),
          ));
    }

    Widget listMonthFeed() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.list_fishGrading
                .map(
                  (fishGrading) => GradingCard(
                    fishList: fishGrading.fishList,
                    date: fishGrading.getDate(),
                    type: fishGrading.type,
                    sampleAmount: fishGrading.sampleAmount.toString(),
                    sampleWeight: fishGrading.sampleWeight!.toStringAsFixed(2),
                    sampleLength: fishGrading.sampleLength!.toStringAsFixed(2),
                    fcr: fishGrading.fcr!.toStringAsFixed(2),
                  ),
                )
                .toList(),
          ));
    }

    Widget sizingSec() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        padding: EdgeInsets.only(top: 16, bottom: 16, right: 20, left: 20),
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
                        onPressed: () {
                          Get.to(() => ConstantaGradingPage(), arguments: {
                            "activation": controller.activation,
                            "pond": controller.pond
                          });
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Edit',
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
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        print('object');
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Rekapitulasi Grading"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              gradingDataRecap(),
              controller.fishGradingChart == null
                  ? emptyChartGrading()
                  : chartGrading(),
              // detail(),
              // sizingSec(),
              entryGradingButton(),
              recapTitle(),
              // chartRecap(),
              controller.list_fishGrading.isEmpty
                  ? emptyListPond()
                  : listMonthFeed(),
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

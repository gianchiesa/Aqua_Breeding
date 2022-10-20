import 'package:fish/pages/component/death_card.dart';
import 'package:fish/pages/fish/fish_recap_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/fish/fish_death_entry_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FishRecapPage extends StatelessWidget {
  const FishRecapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FishRecapController controller = Get.put(FishRecapController());

    Widget chartDeath() {
      return Container(
        child: SfCartesianChart(
          enableAxisAnimation: true,
          tooltipBehavior: TooltipBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePanning: true,
          ),
          title: ChartTitle(
              text: 'Jumlah Ikan Hidup',
              textStyle: TextStyle(color: Colors.white)),
          legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              textStyle: TextStyle(color: Colors.white)),
          primaryXAxis: CategoryAxis(
              labelStyle: TextStyle(color: Colors.white),
              autoScrollingDelta: 4),
          primaryYAxis: NumericAxis(
              // maximum: 100,
              // minimum: 0,
              labelStyle: TextStyle(color: Colors.white)),
          series: <ChartSeries>[
            LineSeries<FishLiveData, dynamic>(
                enableTooltip: true,
                color: Colors.red,
                dataSource: controller.charData,
                xValueMapper: (FishLiveData fish, _) => fish.date,
                yValueMapper: (FishLiveData fish, _) => fish.amount,
                name: 'Ikan Hidup')
          ],
        ),
      );
    }

    Widget fishDataRecap() {
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
                  "Kolam Alpha",
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

    Widget entryDeathButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => FishDeathEntryPage(), arguments: controller.pond);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Entry Kematian Ikan',
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
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jumlah Ikan Hidup",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.activation.fishLive!
                      .map(
                        (fish) => Text(
                          "${fish.type} : ${fish.amount} Ekor",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                      .toList(),
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
                  "Jumah Ikan Mati",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.activation.fishDeath!
                      .map(
                        (fish) => Text(
                          "${fish.type} : ${fish.amount} Ekor",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      )
                      .toList(),
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
          "Rekapitulasi Kematian",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget listDeath() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.list_fishDeath
                .map(
                  (fishDeath) => DeathCard(
                    fishDeath: fishDeath,
                  ),
                )
                .toList(),
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Rekapitulasi Jumlah Kematian"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              chartDeath(),
              fishDataRecap(),
              detail(),
              // sizingSec(),
              entryDeathButton(),
              recapTitle(),
              // chartRecap(),
              listDeath(),
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

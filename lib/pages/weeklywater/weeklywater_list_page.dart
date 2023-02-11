import 'package:fish/pages/component/daily_water_card.dart';
import 'package:fish/controllers/weeklywater/weekly_water_controller.dart';
import 'package:fish/pages/component/weekly_water_card.dart';
import 'package:fish/pages/weeklywater/weeklywater_avg.dart';
import 'package:fish/pages/weeklywater/weeklywater_entry_page.dart';
// import 'package:fish/pages/dailywater/daily_water_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class WeeklyWaterPage extends StatefulWidget {
  WeeklyWaterPage({Key? key}) : super(key: key);

  @override
  State<WeeklyWaterPage> createState() => _WeeklyWaterPageState();
}

class _WeeklyWaterPageState extends State<WeeklyWaterPage> {
  final WeeklyWaterController controller = Get.put(WeeklyWaterController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getWeeklyWaterData(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget fishDataRecap() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kolam ${controller.pond.alias!}",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: heavy,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => WeeklyWaterAvgPage(), arguments: {
                  "pond": controller.pond,
                  "activation": controller.activation
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Rata-Rata/Minggu ',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget listWeeklyWater() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.listWeeklyWater
                .map(
                  (weeklyWaterList) => WeeklyWaterCard(
                      weeklyWaterList: weeklyWaterList,
                      activation: controller.activation,
                      pond: controller.pond),
                )
                .toList(),
          ));
    }

    Widget emptyList() {
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
                "Kolam belum pernah dilakukan treatment",
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
                "Silahkan masukan treatment",
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

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => WeeklyWaterEntryPage(), arguments: {
                "pond": controller.pond,
                "activation": controller.activation
              });
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              controller.listWeeklyWater.isEmpty
                  ? emptyList()
                  : listWeeklyWater(),
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

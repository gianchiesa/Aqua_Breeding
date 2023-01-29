import 'package:fish/controllers/daily_water/daily_water_pond_list_controller.dart';
import 'package:fish/pages/component/list_pond_daily_water_card.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class DailyWaterPondPage extends StatelessWidget {
  DailyWaterPondPage({Key? key}) : super(key: key);

  final DailyWaterPondListController controller =
      Get.put(DailyWaterPondListController());

  @override
  Widget build(BuildContext context) {
    // Widget title() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: defaultMargin,
    //       left: defaultMargin,
    //       right: defaultMargin,
    //     ),
    //     child: Text(
    //       controller.ponds.toString(),
    //       style: primaryTextStyle.copyWith(
    //         fontSize: 24,
    //         fontWeight: semiBold,
    //       ),
    //     ),
    //   );
    // }

    // Widget pondList() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 14),
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           SizedBox(
    //             width: defaultMargin,
    //           ),
    //           Column(
    //             children: controller.ponds
    //                 .map(
    //                   (pond) => DailyWaterListPondCard(pond: pond),
    //                 )
    //                 .toList(),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    Widget dailyWaterPonds() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return DailyWaterListPondCard(pond: controller.ponds[index]
                // indicatorWater: controller.indicatorWater[index]);
                );
          }),
          itemCount: controller.ponds.length,
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              // title(),
              dailyWaterPonds(),
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

import 'package:fish/pages/component/fish_card.dart';
import 'package:fish/pages/component/statistic_card.dart';
import 'package:fish/pages/component/water_card.dart';
import 'package:fish/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller =
        Get.put(HomeController(), permanent: false);

    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Home',
          style: primaryTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget statistic() {
      return Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Kolam',
                        value: controller.statistic.value.total_pond,
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Kolam Aktif',
                        value: controller.statistic.value.active_pond,
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Ikan Hidup',
                        value: controller.statistic.value.fish_live,
                        unit: 'Ekor',
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Ikan Mati',
                        value: controller.statistic.value.fish_death,
                        unit: 'Ekor',
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Panen 2022',
                        value: controller.statistic.value.fish_harvested,
                        unit: 'Kg',
                      )),
                  Expanded(
                      flex: 1,
                      child: StatisticCard(
                        title: 'Total Pakan',
                        value: controller.statistic.value.total_feed_dose,
                        unit: 'Kg',
                      )),
                ],
              ),
            ],
          ));
    }

    Widget fishTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultSpace,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Berat Ikan',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget fish() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(children: [
                FishCard(
                  title: "Lele",
                  value: controller.statistic.value.fishes_weight_lele!,
                  image: "assets/lele.png",
                ),
                FishCard(
                  title: "Nila Merah",
                  value: controller.statistic.value.fishes_weight_nilamerah!,
                  image: "assets/nilamerah.png",
                ),
                FishCard(
                  title: "Nila Hitam",
                  value: controller.statistic.value.fishes_weight_nilahitam!,
                  image: "assets/nilahitam.png",
                ),
                FishCard(
                  title: "Mas",
                  value: controller.statistic.value.fishes_weight_mas!,
                  image: "assets/mas.png",
                ),
              ]),
            ],
          ),
        ),
      );
    }

    Widget waterTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultSpace,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kualitas Air',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget water() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(children: [
                WaterCard(
                  title: "pH",
                  normal: controller.statistic.value.ph_normal,
                  abnormal: controller.statistic.value.ph_abnormal,
                ),
                WaterCard(
                  title: "DO",
                  normal: controller.statistic.value.do_normal,
                  abnormal: controller.statistic.value.do_abnormal,
                ),
                WaterCard(
                  title: "Flok",
                  normal: controller.statistic.value.floc_normal,
                  abnormal: controller.statistic.value.floc_abnormal,
                ),
              ]),
            ],
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return ListView(
          children: [
            title(),
            statistic(),
            fishTitle(),
            fish(),
            waterTitle(),
            water(),
            SizedBox(
              height: 10,
            )
          ],
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

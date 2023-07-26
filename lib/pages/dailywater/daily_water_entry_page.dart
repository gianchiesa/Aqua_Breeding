import 'package:fish/controllers/daily_water/daily_water_entry_controller.dart';
import 'package:fish/controllers/daily_water/daily_water_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../component/tabviewwater.dart';

class DailyWaterEntryPage extends StatelessWidget {
  DailyWaterEntryPage({Key? key}) : super(key: key);

  final DailyWaterEntryController controller =
      Get.put(DailyWaterEntryController());

  final DailyWaterController water = Get.put(DailyWaterController());

  @override
  Widget build(BuildContext context) {
    Widget doInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do Air',
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
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  onChanged: controller.doValChanged,
                  onTap: controller.valdoVal,
                  controller: controller.doController,
                  decoration: controller.validatedoVal.value == true
                      ? controller.doVal == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : InputDecoration.collapsed(
                          hintText: 'ex: 21', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget phInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'pH Air',
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
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  onChanged: controller.phChanged,
                  onTap: controller.valph,
                  controller: controller.phController,
                  decoration: controller.validateph.value == true
                      ? controller.ph == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : InputDecoration.collapsed(
                          hintText: 'ex: 5.4', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget temperatureInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suhu Air',
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
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.tempChanged,
                  onTap: controller.valtemp,
                  controller: controller.temperatureController,
                  decoration: controller.validatetemp.value == true
                      ? controller.temp == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : InputDecoration.collapsed(
                          hintText: 'ex: 19', hintStyle: subtitleTextStyle),
                );
              })),
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
            // Get.back();

            controller.phController.text == "" ||
                    controller.doController.text == "" ||
                    controller.temperatureController.text == ''
                ? null
                : await controller.postDailyWaterData(
                    context,
                    () {
                      Navigator.pop(context);
                      water.getDailyWaterData(context);
                      // Get.offUntil(
                      //     MaterialPageRoute(
                      //         builder: (context) => MyWaterTabScreen()),
                      //     (Route<dynamic> route) => false);
                      // Get.off(MyWaterTabScreen(), arguments: {
                      //   'pond': controller.pond,
                      //   'activation': controller.activation
                      // });

                      // Get.close(1);
                    },
                  );
            controller.postDataLog(controller.fitur);
            // controller.getWeek();
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
            title:
                Text("Entry Kondisi Air Harian Kolam ${controller.pond.alias}"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              phInput(),
              doInput(),
              temperatureInput(),
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

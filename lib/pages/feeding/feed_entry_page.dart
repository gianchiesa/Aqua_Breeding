import 'package:fish/pages/feeding/feed_entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'feed_controller.dart';

class FeedEntryPage extends StatelessWidget {
  const FeedEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedEntryController controller = Get.put(FeedEntryController());
    final FeedController feedcontroller = Get.put(FeedController());
    // Widget feedTypeInput1() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //         top: defaultSpace, right: defaultMargin, left: defaultMargin),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           'Jenis Pakan',
    //           style: primaryTextStyle.copyWith(
    //             fontSize: 16,
    //             fontWeight: medium,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 12,
    //         ),
    //         Container(
    //           height: 50,
    //           padding: EdgeInsets.symmetric(
    //             horizontal: 16,
    //           ),
    //           decoration: BoxDecoration(
    //             color: backgroundColor2,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Center(
    //             child: TextFormField(
    //               style: primaryTextStyle,
    //               inputFormatters: <TextInputFormatter>[
    //                 FilteringTextInputFormatter.digitsOnly
    //               ],
    //               keyboardType: TextInputType.number,
    //               controller: controller.feedTypeController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'ex: Pelet',
    //                 hintStyle: subtitleTextStyle,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget feedTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Pakan',
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
                child: Obx(() => DropdownButtonFormField<String>(
                      onChanged: (newValue) => controller.feedTypeFormController
                          .setSelected(newValue!),
                      value: controller.feedTypeFormController.selected.value,
                      items: controller.feedTypeFormController.listFeedType
                          .map((feedtype) {
                        return DropdownMenuItem<String>(
                          value: feedtype.type,
                          child: Text(
                            feedtype.type.toString(),
                            style: primaryTextStyle,
                          ),
                        );
                      }).toList(),
                      dropdownColor: backgroundColor5,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
              ),
            ),
          ],
        ),
      );
    }

    Widget feedDosisInput() {
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
              child: Center(child: Obx(() {
                return TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  onChanged: controller.doseChanged,
                  onTap: controller.valdose,
                  controller: controller.feedDosisController,
                  decoration: controller.validatedose.value == true
                      ? controller.dose == ''
                          ? InputDecoration(
                              errorText: 'Dosis tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : InputDecoration.collapsed(
                          hintText: 'ex: 2.1', hintStyle: subtitleTextStyle),
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
            controller.feedDosisController.text == ""
                ? null
                : Navigator.pop(context);
            controller.postFeedHistory();
            feedcontroller.getChartFeed(
                activation_id: controller.activation.id.toString());
            feedcontroller.getWeeklyRecapFeedHistory(
                activation_id: controller.activation.id.toString());
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
            title: const Text("Entry Pakan"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              // pondInput(),
              feedTypeInput(),
              feedDosisInput(),
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

import 'package:fish/pages/grading/grading_entry_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../component/fish_list_card.dart';
import 'grading_controller.dart';

class GradingEntryPage extends StatelessWidget {
  const GradingEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GradingEntryController controller = Get.put(GradingEntryController());
    final GradingController gradingcontroller = Get.put(GradingController());
    final DetailPondController detailPondController = Get.find();

    Widget fishTypelInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Ikan',
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
                      onChanged: (newValue) =>
                          controller.fishTypeController.setSelected(newValue!),
                      value: controller.fishTypeController.selected.value,
                      items: controller.listFishAlive.map((fish) {
                        return DropdownMenuItem<String>(
                          value: fish,
                          child: Text(
                            fish,
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
                  children:
                      detailPondController.selectedActivation.value.fishLive!
                          .map(
                            (fish) => FishListCard(fish: fish),
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
                      "${detailPondController.selectedActivation.value.fishAmount.toString()} Ekor",
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
                      "Total Berat",
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
          ),
          SizedBox(height: 30)
        ],
      );
    }

    Widget sampleAmountInput() {
      return Container(
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah Sample (Ekor)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  controller.persentageSample.toStringAsFixed(2) + '%',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium, color: Colors.green),
                ),
              ],
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {
                    controller.updatePersentageSample();
                  },
                  controller: controller.sampleAmountController,
                  decoration: controller.validatesampleAmount.value == true
                      ? controller.sampleAmount == ''
                          ? InputDecoration(
                              errorText: 'jumlah ikan tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'ex: 20', hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'ex: 20', hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget fishWightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berat Total Sample (Kg)',
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
                  // onChanged: controller.fishWeightChanged,
                  // onTap: controller.valfishWeight,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  controller: controller.fishWeightController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2.1', hintStyle: subtitleTextStyle),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget fishLengthAvgInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panjang Rata-rata (cm) (Opsional)',
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
                child: Center(
                    child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.fishLengthAvgController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 23', hintStyle: subtitleTextStyle),
                )),
              ),
            ),
          ],
        ),
      );
    }

    Widget undersizeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Ikan Undersize (Ekor) (Opsional)',
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
                child: Center(
                    child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.undersizeController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 23', hintStyle: subtitleTextStyle),
                )),
              ),
            ),
          ],
        ),
      );
    }

    Widget oversizeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Ikan Oversize (Ekor) (Opsional)',
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
                child: Center(
                    child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.oversizeController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 4', hintStyle: subtitleTextStyle),
                )),
              ),
            ),
          ],
        ),
      );
    }

    Widget normalsizeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Ikan Normalsize (Ekor) (Opsional)',
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                keyboardType: TextInputType.number,
                controller: controller.normalsizeController,
                decoration: InputDecoration.collapsed(
                    hintText: 'ex: 23', hintStyle: subtitleTextStyle),
              )),
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
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            Map<String, dynamic> result = controller.validationInput();
            if (result['isValid'] == false) {
              Get.snackbar('Input Salah', result['message'],
                  titleText: Text(
                    'Input Salah',
                    style: alertTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  messageText: Text(
                    result['message'],
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  backgroundColor: backgroundColor1);
            } else {
              await controller.postFishGrading();
              // update chart
              // await gradingcontroller.getFishGradingChart(
              //     activation_id: controller.activation.id.toString());
              // update list
              await gradingcontroller.getFishGrading(
                  activation_id: controller.activation.id.toString());
              await controller.postDataLog(controller.fitur);
              Get.back();
            }
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
            title: Text("Entry Grading ${controller.pond.alias}"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              SizedBox(
                height: defaultMargin,
              ),
              fishInfo(),
              sampleAmountInput(),
              fishWightInput(),
              fishLengthAvgInput(),
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

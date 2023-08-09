import 'package:fish/models/fish_model.dart';
import 'package:fish/pages/component/treatment_berat_input_card.dart';
import 'package:fish/pages/treatment/treatment_entry_controller.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/theme.dart';

import 'package:fish/pages/component/deactivation_list_input.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TreatmentEntryPage extends StatefulWidget {
  TreatmentEntryPage({Key? key}) : super(key: key);
  @override
  State<TreatmentEntryPage> createState() => _TreatmentEntryPageState();
}

class _TreatmentEntryPageState extends State<TreatmentEntryPage> {
  final TreatmentEntryController controller =
      Get.put(TreatmentEntryController());

  final TreatmentController treatmentTontroller =
      Get.put(TreatmentController());
  void initState() {
    super.initState();
    controller.getHarvestedBool(controller.activation);
  }

  @override
  void dispose() {
    controller.postDataLog(controller.fitur);
    controller.carbonController.clear();
    controller.descController.clear();
    controller.leleWeightController.clear();
    controller.masWeightController.clear();
    controller.nilaHitamWeightController.clear();
    controller.nilaMerahWeightController.clear();
    controller.patinWeightController.clear();
    controller.saltController.clear();
    controller.waterController.clear();
    controller.probioticController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget descInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
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
                  controller: controller.descController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: Ikan Sakit',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget carbonTypeNullInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deskripsi',
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
                  controller: controller.carbonTypeNullController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: Ikan Sakit',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget waterChangeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pergantian Air (%)',
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  style: primaryTextStyle,
                  controller: controller.waterController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 100',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget saltDosisInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dosis Garam (Kg)',
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  style: primaryTextStyle,
                  controller: controller.saltController,
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

    Widget treatmentTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Treatment',
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
                          controller.typeController.setSelected(newValue!),
                      value: controller.typeController.selected.value,
                      items:
                          controller.typeController.listtreatment.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(
                            type,
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

    Widget listTreatmentBeratInput() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return TreatmentBeratCard(
                fish: controller.activation.fishLive![index]);
          }),
          itemCount: controller.activation.fishLive!.length,
        ),
      );
    }

    Widget probioticInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kultur Probiotik (g/mL)',
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
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.probioticController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 2',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget carbonInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Karbon (gram)',
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
                    FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.carbonController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 2',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget carbonTypeInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Carbon',
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
                      onChanged: (newValue) => controller.carbonTypeController
                          .setSelected(newValue!),
                      value: controller.carbonTypeController.selected.value,
                      items: controller.carbonTypeController.listCarbon
                          .map((carbohydrate_type) {
                        return DropdownMenuItem<String>(
                          value: carbohydrate_type,
                          child: Text(
                            carbohydrate_type,
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

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            controller.saltController.text == "" &&
                    controller.carbonController.text == "" &&
                    controller.waterController.text == "" &&
                    controller.probioticController.text == ""
                ? null
                : await controller.postFishGrading(
                    context,
                    () {
                      Navigator.pop(context);
                      treatmentTontroller.getTreatmentData(context);
                    },
                  );
            controller.postDataLog(controller.fitur);
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

    Widget submitBeratButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            await controller.postTreatmentBerat(
              context,
              () {
                Navigator.pop(context);
                treatmentTontroller.getTreatmentData(context);
              },
            );
            controller.postDataLog(controller.fitur);
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
            title: Text("Entry Treatment Kolam ${controller.pond.alias}"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              treatmentTypeInput(),
              descInput(),
              controller.typeController.selected.value == "berat"
                  ? listTreatmentBeratInput()
                  : waterChangeInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : probioticInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : carbonTypeInput(),
              controller.carbonTypeController.selected.value == "tidak ada"
                  ? Container()
                  : carbonInput(),
              controller.typeController.selected.value == "berat"
                  ? Container()
                  : saltDosisInput(),
              controller.typeController.selected.value == "berat"
                  ? submitBeratButton()
                  : submitButton(),
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

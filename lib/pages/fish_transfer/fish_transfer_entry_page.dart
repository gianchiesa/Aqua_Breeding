import 'package:fish/models/fish_model.dart';
import 'package:fish/pages/component/treatment_berat_input_card.dart';
import 'package:fish/pages/treatment/treatment_entry_controller.dart';
import 'package:fish/controllers/fish_transfer/fish_transfer_entry_controller.dart';
import 'package:fish/controllers/fish_transfer/pond_list_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/theme.dart';

import 'package:fish/pages/component/deactivation_list_input.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/fish_transfer/fish_transfer_list_controller.dart';
import '../component/deactivation_with_fish_transfer_input.dart';
import '../component/fish_transfer_input.dart';

class FishTransferEntryPage extends StatefulWidget {
  FishTransferEntryPage({Key? key}) : super(key: key);
  @override
  State<FishTransferEntryPage> createState() => _FishTransferEntryPageState();
}

class _FishTransferEntryPageState extends State<FishTransferEntryPage> {
  final FishTransferEntryController controller =
      Get.put(FishTransferEntryController());

  final TransferController fishTransferController =
      Get.put(TransferController());

  final PondListController getpondlistcontroller =
      Get.put(PondListController());

  final pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    // controller.getHarvestedBool(controller.activation);
    controller.getPondsData(controller.methodController.toString());
    controller.getHarvestedBool(controller.activation);
  }

  @override
  Widget build(BuildContext context) {
    Widget sampleWeightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berat Sample (Gram)',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.sampleWeightChanged,
                  onTap: controller.valsampleWeight,
                  controller: controller.sampleWeightController,
                  decoration: controller.validatesampleWeight.value == true
                      ? controller.sampleWeight == ''
                          ? InputDecoration(
                              errorText: 'ikan tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : null,
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget sampleLongInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panjang Sample',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.sampleLongChanged,
                  onTap: controller.valsampleLong,
                  controller: controller.sampleLongController,
                  decoration: controller.validatesampleLong.value == true
                      ? controller.sampleLong == ''
                          ? InputDecoration(
                              errorText: 'jumlah ikan tidak boleh kosong',
                              isCollapsed: true)
                          : null
                      : null,
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget destinationPondInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kolam Tujuan',
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
                child: Obx(() {
                  return DropdownButtonFormField<String>(
                    onChanged: ((value) {
                      controller.pondlistController
                          .setSelected(value.toString());
                      controller.getDestinationId(value.toString());
                    }),
                    value: controller.pondlistController.selected.value,
                    items: controller.listPondName.map((type) {
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
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }

    Widget transferMethodInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Metode Transfer',
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
                child: Obx(() {
                  return DropdownButtonFormField<String>(
                    onChanged: ((value) {
                      print(controller.listPondName);

                      controller.methodController.setSelected(value.toString());
                      controller.getPondsData(value.toString());
                    }),
                    value: controller.methodController.selected.value,
                    items: controller.methodController.listMethod.map((type) {
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
                  );
                }),
              ),
            ),
          ],
        ),
      );
    }

    Widget checkBoxFishTransfer() {
      return Obx(() => Container(
            margin: EdgeInsets.only(
                top: defaultSpace, right: defaultMargin, left: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih Ikan',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                controller.isNilaHitam.value
                    ? Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Nila Hitam',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: primaryColor,
                          value: controller.isNilaHitamInput.value,
                          onChanged: (bool? value) {
                            controller.setInputNilaHitam(value!);
                            print(controller.isNilaHitamInput.value);
                          },
                        ),
                      )
                    : Container(),
                controller.isNilaMerah.value
                    ? Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Nila Merah',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: primaryColor,
                          value: controller.isNilaMerahInput.value,
                          onChanged: (bool? value) {
                            controller.setInputNilaMerah(value!);
                          },
                        ),
                      )
                    : Container(),
                controller.isLele.value
                    ? Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Lele',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: primaryColor,
                          value: controller.isLeleInput.value,
                          onChanged: (bool? value) {
                            controller.setInputLele(value!);
                          },
                        ),
                      )
                    : Container(),
                controller.isPatin.value
                    ? Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Patin',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: primaryColor,
                          value: controller.isPatinInput.value,
                          onChanged: (bool? value) {
                            controller.setInputPatin(value!);
                          },
                        ),
                      )
                    : Container(),
                controller.isMas.value
                    ? Theme(
                        data: Theme.of(context)
                            .copyWith(unselectedWidgetColor: Colors.white),
                        child: CheckboxListTile(
                          title: Text(
                            'Mas',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: primaryColor,
                          value: controller.isMasInput.value,
                          onChanged: (bool? value) {
                            controller.setInputMas(value!);
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ));
    }

    Widget leleInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lele',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.leleAmountvalChanged,
                  onTap: controller.valleleAmountval,
                  controller: controller.leleAmountController,
                  decoration: controller.validateleleAmountval.value == true
                      ? controller.leleAmountval == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Jumlah Ikan (Ekor)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Jumlah Ikan (Ekor)',
                          hintStyle: subtitleTextStyle),
                );
              })),
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
                  onChanged: controller.leleWeightvalChanged,
                  onTap: controller.valleleWeightval,
                  controller: controller.leleWeightController,
                  decoration: controller.validateleleWeightval.value == true
                      ? controller.leleWeightval == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Berat Ikan (Kg)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Berat Ikan (Kg)',
                          hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget nilaMerahInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nila Merah',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.nilaMerahAmountvalChanged,
                  onTap: controller.valnilaMerahAmountval,
                  controller: controller.nilaMerahAmountController,
                  decoration:
                      controller.validatenilaMerahAmountval.value == true
                          ? controller.nilaMerahAmountval == ''
                              ? InputDecoration(
                                  errorText: 'tidak boleh kosong',
                                  isCollapsed: true)
                              : InputDecoration.collapsed(
                                  hintText: 'Jumlah Ikan (Ekor)',
                                  hintStyle: subtitleTextStyle)
                          : InputDecoration.collapsed(
                              hintText: 'Jumlah Ikan (Ekor)',
                              hintStyle: subtitleTextStyle),
                );
              })),
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
                  onChanged: controller.nilaMerahWeightvalChanged,
                  onTap: controller.valnilaMerahWeightval,
                  controller: controller.nilaMerahWeightController,
                  decoration:
                      controller.validatenilaMerahWeightval.value == true
                          ? controller.nilaMerahWeightval == ''
                              ? InputDecoration(
                                  errorText: 'tidak boleh kosong',
                                  isCollapsed: true)
                              : InputDecoration.collapsed(
                                  hintText: 'Berat Ikan (Kg)',
                                  hintStyle: subtitleTextStyle)
                          : InputDecoration.collapsed(
                              hintText: 'Berat Ikan (Kg)',
                              hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget nilaHitamInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nila Hitam',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.nilaHitamAmountvalChanged,
                  onTap: controller.valnilaHitamAmountval,
                  controller: controller.nilaHitamAmountController,
                  decoration:
                      controller.validatenilaHitamAmountval.value == true
                          ? controller.nilaHitamAmountval == ''
                              ? InputDecoration(
                                  errorText: 'tidak boleh kosong',
                                  isCollapsed: true)
                              : InputDecoration.collapsed(
                                  hintText: 'Jumlah Ikan (Ekor)',
                                  hintStyle: subtitleTextStyle)
                          : InputDecoration.collapsed(
                              hintText: 'Jumlah Ikan (Ekor)',
                              hintStyle: subtitleTextStyle),
                );
              })),
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
                  onChanged: controller.nilaHitamWeightvalChanged,
                  onTap: controller.valnilaHitamWeightval,
                  controller: controller.nilaHitamWeightController,
                  decoration:
                      controller.validatenilaHitamWeightval.value == true
                          ? controller.nilaHitamWeightval == ''
                              ? InputDecoration(
                                  errorText: 'tidak boleh kosong',
                                  isCollapsed: true)
                              : InputDecoration.collapsed(
                                  hintText: 'Berat Ikan (Kg)',
                                  hintStyle: subtitleTextStyle)
                          : InputDecoration.collapsed(
                              hintText: 'Berat Ikan (Kg)',
                              hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget patinInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patin',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.patinAmountvalChanged,
                  onTap: controller.valpatinAmountval,
                  controller: controller.patinAmountController,
                  decoration: controller.validatepatinAmountval.value == true
                      ? controller.patinAmountval == ''
                          ? InputDecoration(
                              errorText: 'jumlah ikan tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Jumlah Ikan (Ekor)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Jumlah Ikan (Ekor)',
                          hintStyle: subtitleTextStyle),
                );
              })),
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
                  onChanged: controller.patinWeightvalChanged,
                  onTap: controller.valpatinWeightval,
                  controller: controller.patinWeightController,
                  decoration: controller.validatepatinWeightval.value == true
                      ? controller.patinWeightval == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Berat Ikan (Kg)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Berat Ikan (Kg)',
                          hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    Widget masInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mas',
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
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  onChanged: controller.masAmountvalChanged,
                  onTap: controller.valmasAmountval,
                  controller: controller.masAmountController,
                  decoration: controller.validatemasAmountval.value == true
                      ? controller.masAmountval == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Jumlah Ikan (Ekor)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Jumlah Ikan (Ekor)',
                          hintStyle: subtitleTextStyle),
                );
              })),
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
                  onChanged: controller.masWeightvalChanged,
                  onTap: controller.valmasWeightval,
                  controller: controller.masWeightController,
                  decoration: controller.validatemasWeightval.value == true
                      ? controller.masWeightval == ''
                          ? InputDecoration(
                              errorText: 'tidak boleh kosong',
                              isCollapsed: true)
                          : InputDecoration.collapsed(
                              hintText: 'Berat Ikan (Kg)',
                              hintStyle: subtitleTextStyle)
                      : InputDecoration.collapsed(
                          hintText: 'Berat Ikan (Kg)',
                          hintStyle: subtitleTextStyle),
                );
              })),
            ),
          ],
        ),
      );
    }

    // Widget listTransferInput() {
    //   return Container(
    //     width: double.infinity,
    //     margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
    //     child: ListView.builder(
    //       shrinkWrap: true,
    //       primary: false,
    //       itemBuilder: ((context, index) {
    //         return FishTransferInputCard(
    //             fish: controller.activation.fishLive![index]);
    //       }),
    //       itemCount: controller.activation.fishLive!.length,
    //     ),
    //   );
    // }

//input aktivasi
    Widget checkBoxFish() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilih Ikan',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                title: Text(
                  'Nila Hitam',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkColor: Colors.white, // color of tick Mark
                activeColor: primaryColor,
                value: controller.isNilaHitamActivation.value,
                onChanged: (bool? value) {
                  controller.setNilaHitam(value!);
                  print(controller.isNilaHitamActivation.value);
                },
              ),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                title: Text(
                  'Nila Merah',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkColor: Colors.white, // color of tick Mark
                activeColor: primaryColor,
                value: controller.isNilaMerahActivation.value,
                onChanged: (bool? value) {
                  controller.setNilaMerah(value!);
                },
              ),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                title: Text(
                  'Lele',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkColor: Colors.white, // color of tick Mark
                activeColor: primaryColor,
                value: controller.isLeleActivation.value,
                onChanged: (bool? value) {
                  controller.setLele(value!);
                },
              ),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                title: Text(
                  'Patin',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkColor: Colors.white, // color of tick Mark
                activeColor: primaryColor,
                value: controller.isPatinActivation.value,
                onChanged: (bool? value) {
                  controller.setPatin(value!);
                },
              ),
            ),
            Theme(
              data: Theme.of(context)
                  .copyWith(unselectedWidgetColor: Colors.white),
              child: CheckboxListTile(
                title: Text(
                  'Mas',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                checkColor: Colors.white, // color of tick Mark
                activeColor: primaryColor,
                value: controller.isMasActivation.value,
                onChanged: (bool? value) {
                  controller.setMas(value!);
                },
              ),
            ),
          ],
        ),
      );
    }

    Widget waterHeightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tinggi air (meter)',
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
                  controller: controller.waterHeightController,
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

    Widget leleInputActivation() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lele',
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
                  controller: controller.leleAmountActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jumlah Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
                  controller: controller.leleWeightActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Berat Total Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nilaMerahInputActivation() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nila Merah',
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
                  controller: controller.nilaMerahAmountActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jumlah Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
                  controller: controller.nilaMerahWeightActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Berat Total Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nilaHitamInputActivation() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nila Hitam',
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
                  controller: controller.nilaHitamAmountActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jumlah Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
                  controller: controller.nilaHitamWeightActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Berat Total Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget patinInputActivation() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patin',
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
                  controller: controller.patinAmountActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jumlah Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
                  controller: controller.patinWeightActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Berat Total Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget masInputActivation() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mas',
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
                  controller: controller.masAmountActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jumlah Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
                  controller: controller.masWeightActivationController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Berat Total Ikan',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
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
            await controller.postFishTransferBasah(
              context,
              () {
                Navigator.pop(context);
              },
            );
            fishTransferController.getTransfertData(context);
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

    Widget submitKeringButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            await controller.postSortirKering(
              context,
              () {
                Navigator.pop(context);
              },
            );
            fishTransferController.getTransfertData(context);
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

    Widget previousSubmitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => pageController.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Kembali',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  // Get.back();
                  await controller.postSortirKering(
                    context,
                    () {
                      Navigator.pop(context);
                    },
                  );
                  fishTransferController.getTransfertData(context);
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
            )
          ],
        ),
      );
    }

    Widget previousNextButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => pageController.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Kembali',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () => pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Berikutnya',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget nextButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () => controller.sampleLongController.text == "" ||
                  controller.sampleWeightController.text == '' ||
                  controller.pondSelected == "pilih kolam"
              ? null
              : pageController.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut),
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Berikutnya',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget previousButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () => pageController.previousPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut),
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Kembali',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget deactivationInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return FishTransferDeactivationListCard(
                fish: controller.activation.fishLive![index]);
          }),
          itemCount: controller.activation.fishLive!.length,
        ),
      );
    }

    Widget destinationnNotActiveTransfer() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Kolam yang dituju belum aktif",
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
                "Silahkan aktifasi kolam terlebih dahulu",
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

    Widget deactivationTransfer() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Center(
            child: Column(children: [
              SizedBox(height: 20),
              Text(
                "Silahkan masukan data ikan yang tidak disortir (panen)",
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: const Text("Entry Sortir"),
        ),
        backgroundColor: backgroundColor1,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            Obx(() {
              return ListView(
                children: [
                  transferMethodInput(),
                  destinationPondInput(),
                  checkBoxFishTransfer(),
                  controller.isNilaHitamInput == true
                      ? nilaHitamInput()
                      : Container(),
                  controller.isNilaMerahInput == true
                      ? nilaMerahInput()
                      : Container(),
                  controller.isLeleInput == true ? leleInput() : Container(),
                  controller.isPatinInput == true ? patinInput() : Container(),
                  controller.isMasInput == true ? masInput() : Container(),
                  sampleLongInput(),
                  sampleWeightInput(),
                  controller.methodController.selected.value == "basah"
                      ? submitButton()
                      : nextButton(),
                  SizedBox(
                    height: 8,
                  )
                ],
              );
            }),
            Obx(() {
              return ListView(
                children: [
                  controller.destinationIsActive == false
                      ? destinationnNotActiveTransfer()
                      : deactivationInput(),
                  controller.destinationIsActive == false
                      ? checkBoxFish()
                      : deactivationInput(),
                  controller.isNilaHitamActivation == true
                      ? nilaHitamInputActivation()
                      : Container(),
                  controller.isNilaMerahActivation == true
                      ? nilaMerahInputActivation()
                      : Container(),
                  controller.isLeleActivation == true
                      ? leleInputActivation()
                      : Container(),
                  controller.isPatinActivation == true
                      ? patinInputActivation()
                      : Container(),
                  controller.isMasActivation == true
                      ? masInputActivation()
                      : Container(),
                  controller.destinationIsActive == false
                      ? waterHeightInput()
                      : Container(),
                  controller.destinationIsActive == false
                      ? previousNextButton()
                      : previousSubmitButton(),
                  SizedBox(
                    height: 8,
                  )
                ],
              );
            }),
            ListView(
              children: [
                deactivationTransfer(),
                deactivationInput(),
                previousSubmitButton(),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ],
        ));
  }
}

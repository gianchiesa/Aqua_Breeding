import 'dart:convert';

import 'package:fish/controllers/fish_transfer/fish_transfer_entry_controller.dart';
import 'package:fish/controllers/fish_transfer/pond_list_item_controller.dart';
import 'package:fish/pages/fish_transfer/new_fish_transfer_input_page.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/service/fish_transfer_service.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/fish_transfer/fish_transfer_list_controller.dart';
import '../../models/new_sortir_model.dart';
import '../component/deactivation_with_fish_transfer_input.dart';

class NewFishTransferEntryPage extends StatefulWidget {
  const NewFishTransferEntryPage({Key? key}) : super(key: key);
  @override
  State<NewFishTransferEntryPage> createState() =>
      _NewFishTransferEntryPageState();
}

class _NewFishTransferEntryPageState extends State<NewFishTransferEntryPage> {
  final FishTransferEntryController controller =
      Get.put(FishTransferEntryController());

  final TransferController fishTransferController =
      Get.put(TransferController());

  final PondListController getpondlistcontroller =
      Get.put(PondListController());

  final pageController = PageController(initialPage: 0);

  final PondController pondController = Get.find();
  final DetailPondController detailPondController = Get.find();
  @override
  void dispose() {
    controller.descController.clear();
    controller.sampleLongController.clear();
    controller.sampleWeightController.clear();
    controller.leleAmountActivationController.clear();
    controller.leleAmountController.clear();
    controller.leleAmountDeactivationController.clear();
    controller.leleWeightActivationController.clear();
    controller.leleWeightController.clear();
    controller.leleWeightDeactivationController.clear();
    controller.masAmountActivationController.clear();
    controller.masAmountController.clear();
    controller.masAmountDeactivationController.clear();
    controller.masWeightActivationController.clear();
    controller.masWeightController.clear();
    controller.masWeightDeactivationController.clear();
    controller.patinAmountActivationController.clear();
    controller.patinAmountController.clear();
    controller.patinAmountDeactivationController.clear();
    controller.patinWeightActivationController.clear();
    controller.patinWeightController.clear();
    controller.patinWeightDeactivationController.clear();
    controller.nilaMerahAmountActivationController.clear();
    controller.nilaMerahAmountController.clear();
    controller.nilaMerahAmountDeactivationController.clear();
    controller.nilaMerahWeightActivationController.clear();
    controller.nilaMerahWeightController.clear();
    controller.nilaMerahWeightDeactivationController.clear();
    controller.nilaHitamAmountActivationController.clear();
    controller.nilaHitamAmountController.clear();
    controller.nilaHitamAmountDeactivationController.clear();
    controller.nilaHitamWeightActivationController.clear();
    controller.nilaHitamWeightController.clear();
    controller.nilaHitamWeightDeactivationController.clear();
    pageController.dispose();
    controller.postDataLog(controller.fitur);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    // controller.getHarvestedBool(controller.activation);
    controller.getPondsData(controller.methodController.toString());
    controller.getHarvestedBool(controller.activation);
    // controller.buildFishDeath();
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
              'Panjang Sample (cm)',
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

    // Widget destinationPondInput() {
    //   return Obx(() {
    //     return ListView.builder(
    //       shrinkWrap: true,
    //       itemCount: controller.pondlistController.initialLenght.toInt(),
    //       itemBuilder: (context, index) {
    //         return Obx(() {
    //           return Container(
    //             margin: EdgeInsets.only(
    //                 top: defaultSpace,
    //                 right: defaultMargin,
    //                 left: defaultMargin),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   'Kolam Tujuan ${index + 1}',
    //                   style: primaryTextStyle.copyWith(
    //                     fontSize: 16,
    //                     fontWeight: medium,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 12,
    //                 ),
    //                 Container(
    //                   height: 50,
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 16,
    //                   ),
    //                   decoration: BoxDecoration(
    //                     color: backgroundColor2,
    //                     borderRadius: BorderRadius.circular(12),
    //                   ),
    //                   child: Center(
    //                     child: Obx(() {
    //                       return DropdownButtonFormField<String>(
    //                         hint: Text(
    //                           "Pilih Kolam",
    //                           style: primaryTextStyle,
    //                         ),
    //                         onChanged: ((value) {
    //                           // controller.pondlistController
    //                           //     .setSelected(value.toString());
    //                           print(value);
    //                           // controller.getDestinationId(value.toString());
    //                           controller.pondlistController.setSelected(value!);
    //                         }),
    //                         // value: ,
    //                         items: controller.listPondName.map((type) {
    //                           return DropdownMenuItem<String>(
    //                             value: type,
    //                             child: Text(
    //                               type,
    //                               style: primaryTextStyle,
    //                             ),
    //                           );
    //                         }).toList(),
    //                         dropdownColor: backgroundColor5,
    //                         decoration:
    //                             InputDecoration(border: InputBorder.none),
    //                       );
    //                     }),
    //                   ),
    //                 ),
    //                 if (controller.pondlistController.initialLenght.toInt() ==
    //                     1) ...[
    //                   if (controller
    //                           .pondlistController.listPondSelected.length ==
    //                       controller.pondlistController.initialLenght
    //                           .toInt()) ...[
    //                     Column(
    //                       children: [
    //                         SizedBox(
    //                           height: 16,
    //                         ),
    //                         GestureDetector(
    //                           onTap: () {
    //                             setState(() {
    //                               controller.pondlistController.initialLenght +
    //                                   1;
    //                             });
    //                           },
    //                           child: Row(
    //                             children: [
    //                               Icon(
    //                                 Icons.add_circle_outline,
    //                                 color: Colors.blue,
    //                               ),
    //                               SizedBox(
    //                                 width: 8,
    //                               ),
    //                               Text(
    //                                 "Tambah",
    //                                 style: primaryTextStyle,
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 16,
    //                         ),
    //                       ],
    //                     )
    //                   ] else ...[
    //                     SizedBox(
    //                       height: 16,
    //                     ),
    //                   ]
    //                 ] else ...[
    //                   if (controller.pondlistController.initialLenght.toInt() ==
    //                       index + 1) ...[
    //                     if (controller.pondlistController.initialLenght
    //                             .toInt() ==
    //                         controller.pondlistController.listPondSelected
    //                             .length) ...[
    //                       Column(
    //                         children: [
    //                           SizedBox(
    //                             height: 16,
    //                           ),
    //                           Row(
    //                             mainAxisAlignment:
    //                                 MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               GestureDetector(
    //                                 onTap: () {
    //                                   setState(() {
    //                                     print("111");
    //                                     controller.pondlistController
    //                                             .initialLenght +
    //                                         1;
    //                                   });
    //                                 },
    //                                 child: Row(
    //                                   children: [
    //                                     Icon(
    //                                       Icons.add_circle_outline,
    //                                       color: Colors.blue,
    //                                     ),
    //                                     SizedBox(
    //                                       width: 8,
    //                                     ),
    //                                     Text(
    //                                       "Tambah",
    //                                       style: primaryTextStyle,
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                               GestureDetector(
    //                                 onTap: () {
    //                                   setState(() {
    //                                     if (controller.pondlistController
    //                                             .listPondSelected.length ==
    //                                         controller.pondlistController
    //                                             .initialLenght
    //                                             .toInt()) {
    //                                       controller.pondlistController
    //                                           .listPondSelected
    //                                           .removeLast();
    //                                     }
    //                                     controller.pondlistController
    //                                             .initialLenght -
    //                                         1;
    //                                   });
    //                                 },
    //                                 child: Row(
    //                                   children: [
    //                                     Icon(
    //                                       Icons.remove_circle,
    //                                       color: Colors.red,
    //                                     ),
    //                                     SizedBox(
    //                                       width: 8,
    //                                     ),
    //                                     Text(
    //                                       "Hapus",
    //                                       style: primaryTextStyle,
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height: 16,
    //                           ),
    //                         ],
    //                       ),
    //                     ] else ...[
    //                       Column(
    //                         children: [
    //                           SizedBox(
    //                             height: 16,
    //                           ),
    //                           Row(
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             children: [
    //                               GestureDetector(
    //                                 onTap: () {
    //                                   setState(() {
    //                                     if (controller.pondlistController
    //                                             .listPondSelected.length ==
    //                                         controller.pondlistController
    //                                             .initialLenght
    //                                             .toInt()) {
    //                                       controller.pondlistController
    //                                           .listPondSelected
    //                                           .removeLast();
    //                                     }
    //                                     controller.pondlistController
    //                                             .initialLenght -
    //                                         1;
    //                                   });
    //                                 },
    //                                 child: Row(
    //                                   children: [
    //                                     Icon(
    //                                       Icons.remove_circle,
    //                                       color: Colors.red,
    //                                     ),
    //                                     SizedBox(
    //                                       width: 8,
    //                                     ),
    //                                     Text(
    //                                       "Hapus",
    //                                       style: primaryTextStyle,
    //                                     )
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                           SizedBox(
    //                             height: 16,
    //                           ),
    //                         ],
    //                       ),
    //                     ]
    //                   ] else ...[
    //                     Container()
    //                   ]
    //                 ]
    //               ],
    //             ),
    //           );
    //         });
    //       },
    //     );
    //   });
    // }

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
                horizontal: 12,
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
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            // await controller.postFishTransferBasah(
            //   context,
            //   () {
            //     Navigator.pop(context);
            //     fishTransferController.getTransfertData(context);
            //   },
            // );
            // controller.postDataLog(controller.fitur);
            await postData();
            await pondController.updateListandSelectedPond();
            await detailPondController.updateListAndSelectedActivation();
            await fishTransferController.getTransfertData();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green,
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
            fishTransferController.getTransfertData();
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
                      fishTransferController.getTransfertData();
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
      return Obx(() {
        return Container(
          height: 50,
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: TextButton(
            onPressed: () {
              if (controller.listPondSelected.isNotEmpty &&
                  controller
                      .totalAmountDeactivationController.text.isNotEmpty &&
                  controller
                      .totalWeightDeactivationController.text.isNotEmpty) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: controller.listPondSelected.isNotEmpty &&
                      controller
                          .totalAmountDeactivationController.text.isNotEmpty &&
                      controller
                          .totalWeightDeactivationController.text.isNotEmpty
                  ? Colors.green
                  : Colors.grey,
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
      });
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

    Widget listSelected() {
      return Obx(() {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listPondSelected.isEmpty
                ? 1
                : controller.listPondSelected.length,
            itemBuilder: ((context, index) {
              if (controller.listPondSelected.isEmpty) {
                return Container();
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                          () => NewFishTransferInputPage(
                                index: index,
                                pond: controller.listPondSelected[index],
                              ),
                          arguments: {
                            "pond": controller.pond,
                            "activation": controller.activation
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 12, right: 12),
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: primaryColor),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Kolam ${controller.listPondSelected[index].name}",
                              style: primaryTextStyle.copyWith(),
                            ),
                            if (controller.listPondSelected[index].isInputed ==
                                false) ...[
                              Text(
                                "Data belum diisi",
                                style: primaryTextStyle.copyWith(
                                    color: Colors.red),
                              ),
                            ] else ...[
                              Text(
                                "Data lengkap",
                                style: primaryTextStyle.copyWith(
                                    color: Colors.green),
                              ),
                            ]
                          ]),
                    ),
                  ),
                );
              }
            }));
      });
    }

    // Widget addButton() {
    //   return Padding(
    //     padding: EdgeInsets.all(16),
    //     child:
    //   );
    // }

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

    Widget destinationPond() {
      return Row(
        children: [
          Expanded(
            // margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
            // width: double.infinity,
            child: Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Obx(() {
                return MultiSelectDialogField<ListPondSortir>(
                  title: Text("List Kolam"),
                  buttonText: Text(
                    "Pilih Kolam",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: backgroundColor2,
                      borderRadius: BorderRadius.circular(12)),
                  buttonIcon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey.shade700,
                  ),
                  items: controller.listPond
                      .map((e) => MultiSelectItem(e, e.name!))
                      .toList(),
                  listType: MultiSelectListType.LIST,
                  onConfirm: (values) {
                    controller.setData(values);
                  },
                );
              }),
            ),
          ),
        ],
      );
    }

    Widget fishWightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Berat Rata-rata Ikan (Kg)',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () => controller.calculateAvgWeightFish(),
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Hitung',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: double.infinity,
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
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.deny(RegExp(r'[-+=*#%/,\s]'))
                ],
                controller: controller.fishWeightController,
              )),
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

    Widget totalWeightInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Berat Ikan Terpanen (Kg)',
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
                controller: controller.totalWeightDeactivationController,
                decoration: InputDecoration.collapsed(
                    hintText: 'ex: 23', hintStyle: subtitleTextStyle),
              )),
            ),
          ],
        ),
      );
    }

    Widget totalFishInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Ikan Terpanen (Ekor)',
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
                controller: controller.totalAmountDeactivationController,
                decoration: InputDecoration.collapsed(
                    hintText: 'ex: 23', hintStyle: subtitleTextStyle),
              )),
            ),
          ],
        ),
      );
    }

    Widget sampleAmountInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Sample (Ekor)',
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
                  controller: controller.sampleAmountController,
                ))),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: Text("Entry Sortir ${controller.pond.alias}"),
        ),
        backgroundColor: backgroundColor1,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            ListView(
              children: [
                transferMethodInput(),
                SizedBox(
                  height: 16,
                ),
                destinationPond(),
                totalFishInput(),
                totalWeightInput(),
                fishWightInput(),
                sampleAmountInput(),
                fishLengthAvgInput(),
                normalsizeInput(),
                undersizeInput(),
                oversizeInput(),
                // destinationPondInput(),
                // addButton(),
                SizedBox(
                  height: 16,
                ),
                nextButton()
              ],
            ),
            ListView(
              children: [listSelected(), submitButton()],
            )
          ],
        ));
  }

  void removeItemInArray(List<ListPondSortir> arr, int index) {
    if (index >= 0 && index < arr.length) {
      arr.removeAt(index);
      Get.back();
    } else {
      throw RangeError('Index out of bounds');
    }
  }

  Future<void> postData() async {
    bool isFullfiled;
    List<dynamic> transferList = [];

    final indicator = controller.listPondSelected
        .firstWhereOrNull((element) => element.isInputed == false);
    if (indicator != null) {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text('Data belum lengkap',
                    style: TextStyle(color: Colors.red)),
                content: const Text(
                  'Lengkapi data terlebih dahulu',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: backgroundColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ));
    } else {
      for (var i in controller.listPondSelected) {
        transferList.add(i.dataInput);
      }

      print(transferList);
      controller.buildFishDeath(transferList);
      FishTransferService().postTransfer(
          origin_pond_id: controller.pond.id.toString(),
          transfer_method: controller.methodController.selected.value,
          total_fish_harvested:
              controller.totalAmountDeactivationController.text,
          total_weight_harvested:
              controller.totalWeightDeactivationController.text,
          sampleAmount: controller.sampleAmountOriginController.text.isEmpty
              ? '0'
              : controller.sampleAmountOriginController.text,
          sampleLong: controller.sampleLongOriginController.text.isEmpty
              ? "0"
              : controller.sampleLongOriginController.text,
          sampleWeight: controller.sampleWeightOriginController.text.isEmpty
              ? "0"
              : controller.sampleWeightOriginController.text,
          amountNormal: controller.normalsizeController.text.isEmpty
              ? "0"
              : controller.normalsizeController.text,
          amountOversize: controller.oversizeController.text.isEmpty
              ? "0"
              : controller.oversizeController.text,
          amountUndersize: controller.oversizeController.text.isEmpty
              ? "0"
              : controller.oversizeController.text,
          transferList: transferList,
          fishDeath: controller.buildFishDeath(transferList),
          ctx: context);
      fishTransferController.getTransfertData();

      await pondController.updateListandSelectedPond();
      // fishTransferController.getTransfertData(context);

      Get.back();
    }
  }
}

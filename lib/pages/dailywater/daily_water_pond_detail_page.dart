import 'dart:developer';

import 'package:fish/pages/component/activation_for_water_card.dart';
import 'package:fish/pages/pond/deactivation_breed_page.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';

import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class DailyWaterDetailPondPage extends StatefulWidget {
  const DailyWaterDetailPondPage({Key? key}) : super(key: key);

  @override
  State<DailyWaterDetailPondPage> createState() =>
      _DailyWaterDetailPondPageState();
}

class _DailyWaterDetailPondPageState extends State<DailyWaterDetailPondPage> {
  final detailController = Get.put(DailyWaterBreedListController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    detailController.getPondActivation(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget pondStatus() {
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
                  "kolam ${detailController.pond.alias}",
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
                Text(
                  detailController.pond.getGmtToNormalDate(),
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(color: detailController.pond.getColor()),
                border: Border.all(
                    color: detailController.isPondActive.value
                        ? Colors.green
                        : Colors.red.shade300),
                color: transparentColor,
              ),
              child: Center(
                child: Text(
                  detailController.isPondActive.value ? "Aktif" : "Tidak Aktif",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            )
          ],
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
                  "Kondisi pH",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                detailController.pond.status! != "Aktif"
                    ? Text(
                        "-",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : detailController.pond.pondPhDesc!.capitalize == "Normal"
                        ? Text(
                            detailController.pond.pondPhDesc!.capitalize!,
                            style: subtitleTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: bold,
                                color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : detailController.pond.pondPhDesc!.capitalize ==
                                "Berbahaya"
                            ? Text(
                                detailController.pond.pondPhDesc!.capitalize!,
                                style: subtitleTextStyle.copyWith(
                                    fontSize: 13,
                                    fontWeight: bold,
                                    color: Colors.red.shade300),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            : Text(
                                detailController.pond.pondPhDesc!.capitalize!,
                                style: subtitleTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: regular,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Suhu Air",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                detailController.pond.status != "Aktif"
                    ? Text(
                        "-",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : detailController.pond.pondTemp == null
                        ? Text(
                            "Belum Diukur",
                            style: subtitleTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: regular,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : Text(
                            "${detailController.pond.pondTemp} " + "°C",
                            style: subtitleTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kondisi Do",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                detailController.pond.status! != "Aktif"
                    ? Text(
                        "-",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 13,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )
                    : detailController.pond.pondDoDesc!.capitalize == "Normal"
                        ? Text(
                            detailController.pond.pondDoDesc!.capitalize!,
                            style: subtitleTextStyle.copyWith(
                                fontSize: 13,
                                fontWeight: bold,
                                color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : detailController.pond.pondDoDesc!.capitalize ==
                                "Berbahaya"
                            ? Text(
                                detailController.pond.pondDoDesc!.capitalize!,
                                style: subtitleTextStyle.copyWith(
                                    fontSize: 13,
                                    fontWeight: bold,
                                    color: Colors.red.shade300),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            : detailController.pond.pondDoDesc!.capitalize ==
                                    "Semi Berbahaya"
                                ? Text(
                                    detailController
                                        .pond.pondDoDesc!.capitalize!,
                                    style: subtitleTextStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: bold,
                                        color: Colors.amber),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                : Text(
                                    detailController
                                        .pond.pondDoDesc!.capitalize!,
                                    style: subtitleTextStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: regular,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  "",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget activationTitle() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 2, right: defaultMargin, left: defaultMargin),
        child: Text(
          "Musim Budidaya",
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      );
    }

    Widget listActivation() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: detailController.activations
                .map(
                  (activation) => ActivationForWaterCard(
                      activation: activation, pond: detailController.pond),
                )
                .toList(),
          ));
    }

    Widget emptyListActivation() {
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
                "Kolam belum pernah\nmemulai musim budidaya",
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
                "Silahkan memulai musim budidaya!",
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
      backgroundColor: backgroundColor1,
      body: Obx(
        () => detailController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: secondaryColor,
                ),
              )
            : ListView(
                children: [
                  pondStatus(),
                  // detailController.isPondActive.value == false
                  //     ? activationButton()
                  //     : deactivationButton(),
                  detail(),
                  activationTitle(),
                  detailController.activations.isEmpty
                      ? emptyListActivation()
                      : listActivation(),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
      ),
    );
  }
}

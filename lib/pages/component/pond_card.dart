import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/component/detail_pond_tabview.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';

import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../pond/detail_pond_page.dart';

class PondCard extends StatelessWidget {
  final Pond pond;

  const PondCard({Key? key, required this.pond}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PondController pondController = Get.find();
    return GestureDetector(
      onTap: () {
        pondController.updateSelectedPond(pond.id);
        Get.to(() => MyTabPondScreen(), arguments: {
          'pond': pond,
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultSpace),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffECEDEF),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pond.alias!,
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: pond.getColor(),
                  ),
                  child: Center(
                    child: Text(
                      pond.pondStatusStr!,
                      style: blackTextStyle.copyWith(
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
            Divider(color: Colors.black),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/calendar_plus.png',
                          width: 25, color: blackColor),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        pond.lastActivationDate != '-'
                            ? pond.getLastActivationDateEYD()
                            : "-",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "pH:",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: heavy,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      pond.status! != "Aktif"
                          ? Text(
                              "-",
                              style: subtitleTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: regular,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : pond.pondPh == null
                              ? Text(
                                  "-",
                                  style:
                                      subtitleTextStyle.copyWith(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              : pond.pondPhDesc!.capitalize == "Normal"
                                  ? Text(
                                      pond.pondPh.toString(),
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                          color: Colors.green),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                  : pond.pondPhDesc!.capitalize == "Berbahaya"
                                      ? Text(
                                          pond.pondPh.toString(),
                                          style: subtitleTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: bold,
                                              color: Colors.red.shade300),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      : Text(
                                          pond.pondPh.toString(),
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: regular,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/timesheet.png',
                          width: 25, color: blackColor),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${pond.rangeFromLastActivation} Hari",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Do:",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: heavy,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      pond.status! != "Aktif"
                          ? Text(
                              "-",
                              style: subtitleTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: regular,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )
                          : pond.pondDo == null
                              ? Text(
                                  "Belum Diukur",
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )
                              : pond.pondDoDesc!.capitalize == "Normal"
                                  ? Text(
                                      pond.pondDo.toString(),
                                      style: subtitleTextStyle.copyWith(
                                          fontSize: 16,
                                          fontWeight: bold,
                                          color: Colors.green),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    )
                                  : pond.pondDoDesc!.capitalize == "Berbahaya"
                                      ? Text(
                                          pond.pondDo.toString(),
                                          style: subtitleTextStyle.copyWith(
                                              fontSize: 16,
                                              fontWeight: bold,
                                              color: Colors.red.shade300),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        )
                                      : pond.pondDoDesc!.capitalize ==
                                              "Semi Berbahaya"
                                          ? Text(
                                              pond.pondDo.toString(),
                                              style: subtitleTextStyle.copyWith(
                                                  fontSize: 16,
                                                  fontWeight: bold,
                                                  color: Colors.amber),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            )
                                          : Text(
                                              pond.pondDo.toString(),
                                              style: subtitleTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: regular,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/fish_transparent.png',
                          width: 25, color: blackColor),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        pond.getFishAlive() + " Ekor",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/pond_secondary.png',
                        width: 25,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        pond.volume!.toStringAsFixed(2) + " m\u00B3",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/fish_transparent.png',
                          width: 25, color: blackColor),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        pond.getRatioVolumePerFishAlive() + " cm\u00B3 / Ekor",
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: regular,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

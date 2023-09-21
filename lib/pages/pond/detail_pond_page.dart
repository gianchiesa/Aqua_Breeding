import 'dart:developer';

import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/component/activation_card.dart';
import 'package:fish/pages/dailywater/daily_water_entry_page.dart';
import 'package:fish/pages/feeding/feed_entry_page.dart';
import 'package:fish/pages/fish/fish_death_entry_page.dart';
import 'package:fish/pages/pond/activation_breed_controller.dart';
import 'package:fish/pages/pond/activation_breed_page.dart';
import 'package:fish/pages/pond/edit_pond_page.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:fish/pages/pond/add_pond_page.dart';
import 'package:fish/pages/pond/deactivation_breed_page.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../fish_transfer/fish_transfer_entry_page.dart';

class DetailPondPage extends StatefulWidget {
  const DetailPondPage({Key? key}) : super(key: key);

  @override
  State<DetailPondPage> createState() => _DetailPondPageState();
}

class _DetailPondPageState extends State<DetailPondPage> {
  final DetailPondController detailController = Get.put(DetailPondController());
  final PondController pondController = Get.find();

  @override
  void initState() {
    // detailController.getPondActivation(context);
    detailController.updateListAndSelectedActivation();
    super.initState();
  }

  @override
  void activate() {
    print('ini aktif');
    super.activate();
  }

  @override
  void deactivate() {
    print('ini deaktif');
    super.deactivate();
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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "kolam ${detailController.pondController.selectedPond.value.alias}",
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
                      detailController.pondController.selectedPond.value
                          .getGmtToNormalDate(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                IconButton(
                    color: Colors.white,
                    iconSize: 28,
                    onPressed: () {
                      Get.to(() => const EditPondPage());
                    },
                    icon: const Icon(Icons.edit_outlined))
              ],
            ),
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // border: Border.all(color: detailController.pondController.selectedPond.getColor()),
                border: Border.all(
                    color: detailController.isPondActive.value
                        ? Colors.green
                        : Colors.red.shade300),
                color: transparentColor,
              ),
              child: Center(
                child: Text(
                  detailController.isPondActive.value == false
                      ? "Tidak Aktif"
                      : "Aktif",
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

    Widget activationButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.to(() => ActivationBreedPage(), arguments: {
              'pond': detailController.pondController.selectedPond.value,
            });
            detailController.postDataLog(detailController.fitur);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Start Budidaya',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget deactivationButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            Get.defaultDialog(
                title: 'Konfirmasi Panen!',
                middleText: 'Apakah anda yakin ingin melakukan panen?',
                buttonColor: primaryColor,
                confirmTextColor: Colors.white,
                cancelTextColor: Colors.black,
                textConfirm: 'Panen',
                textCancel: 'Tidak',
                onConfirm: (() {
                  Get.back();
                  Get.to(() => DeactivationBreedPage(), arguments: {
                    "pond": detailController.pondController.selectedPond.value,
                  });
                }));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Panen',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
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
                  "Lokasi Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.location!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Bentuk Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.shape!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Volume Air",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.isActive ==
                          true
                      ? detailController
                              .pondController.selectedPond.value.waterVolume!
                              .toStringAsFixed(2) +
                          " Liter"
                      : "-",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
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
                  "Material Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.material!,
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ukuran Kolam",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.shape! ==
                          "persegi"
                      ? "${detailController.pondController.selectedPond.value.length}m x ${detailController.pondController.selectedPond.value.width}m"
                      : "${detailController.pondController.selectedPond.value.diameter}m\u00B2",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  detailController.pondController.selectedPond.value.isActive ==
                          true
                      ? "Ph " +
                          detailController
                              .pondController.selectedPond.value.pondPh!
                              .toStringAsFixed(1)
                      : "pH -",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  detailController.pondController.selectedPond.value.isActive ==
                          true
                      ? "Do " +
                          detailController
                              .pondController.selectedPond.value.pondDo!
                              .toStringAsFixed(1)
                      : "Do -",
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

    Widget fcr() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
          color: transparentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'update terakhir: ',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(width: 10),
                Text(
                  detailController.selectedActivation.value
                      .getStringFcrUpdate(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "FCR",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: light,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(width: 10),
                Text(
                  detailController.selectedActivation.value.fcr!
                      .toStringAsFixed(2),
                  style: purpleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
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

    Widget feedhistory() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor),
          color: transparentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'tanggal: ',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(width: 10),
                Text(
                  detailController.selectedActivation.value
                      .getStringLastFeedDose(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total Pakan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: light,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(width: 10),
                Text(
                  detailController.selectedActivation.value.lastFeedDose
                          .toString() +
                      ' Kg',
                  style: purpleTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
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
          "List Musim Budidaya",
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
                  (activation) => ActivationCard(
                      activation: activation,
                      pond: detailController.pondController.selectedPond.value),
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
                  detailController.isPondActive.value == false
                      ? activationButton()
                      : deactivationButton(),
                  detail(),
                  // fcr(),
                  // feedhistory(),
                  activationTitle(),
                  detailController.activations.isEmpty
                      ? emptyListActivation()
                      : listActivation(),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
      ),
      floatingActionButton: pondController.selectedPond.value.isActive == false
          ? null
          : SpeedDial(
              icon: Icons.add, //icon on Floating action button
              activeIcon: Icons.close, //icon when menu is expanded on button
              backgroundColor:
                  Colors.deepOrangeAccent, //background color of button
              foregroundColor: Colors.white, //font color, icon color in button
              activeBackgroundColor: Colors
                  .deepPurpleAccent, //background color when menu is expanded
              activeForegroundColor: Colors.white,
              visible: true,
              closeManually: false,
              curve: Curves.bounceIn,
              overlayColor: Colors.black,
              overlayOpacity: 0.5,
              onOpen: () => print('OPENING DIAL'), // action when menu opens
              onClose: () => print('DIAL CLOSED'), //action when menu closes

              elevation: 8.0, //shadow elevation of button
              shape: CircleBorder(), //shape of button

              children: [
                SpeedDialChild(
                  //speed dial child
                  child: Icon(Icons.add),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: 'Entry Pemberian Pakan',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    detailController.updateSelectedActivationToLastActivation();
                    Get.to(() => FeedEntryPage(), arguments: {
                      "pond": pondController.selectedPond.value,
                      "activation": detailController.selectedActivation.value,
                    });
                  },
                ),
                SpeedDialChild(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  label: 'Entry Kematian Ikan',
                  labelStyle: TextStyle(fontSize: 18.0),
                  onTap: () {
                    detailController.updateSelectedActivationToLastActivation();
                    Get.to(() => FishDeathEntryPage(), arguments: {
                      "pond": pondController.selectedPond.value,
                      "activation": detailController.selectedActivation.value,
                    });
                  },
                ),
                // SpeedDialChild(
                //   child: Icon(Icons.add),
                //   foregroundColor: Colors.white,
                //   backgroundColor: Colors.green,
                //   label: 'Entry Daily Treatment',
                //   labelStyle: TextStyle(fontSize: 18.0),
                //   onTap: () {},
                //   // onTap: () {
                //   //   detailController.updateSelectedActivationToLastActivation();
                //   //   Get.to(() => DailyWaterEntryPage(), arguments: {
                //   //     "pond": pondController.selectedPond.value,
                //   //     "activation": detailController.selectedActivation.value,
                //   //   });
                //   // },
                // ),
                // SpeedDialChild(
                //   child: Icon(Icons.add),
                //   foregroundColor: Colors.white,
                //   backgroundColor: Colors.yellow,
                //   label: 'Entry Weekly Treatment',
                //   labelStyle: TextStyle(fontSize: 18.0),
                //   onTap: () => print('THIRD CHILD'),
                //   onLongPress: () => print('THIRD CHILD LONG PRESS'),
                // ),
                // SpeedDialChild(
                //   child: Icon(Icons.add),
                //   foregroundColor: Colors.white,
                //   backgroundColor: Colors.purple,
                //   label: 'Entry Grading',
                //   labelStyle: TextStyle(fontSize: 18.0),
                //   onTap: () => print('THIRD CHILD'),
                //   onLongPress: () => print('THIRD CHILD LONG PRESS'),
                // ),
                // SpeedDialChild(
                //   child: Icon(Icons.add),
                //   foregroundColor: Colors.white,
                //   backgroundColor: Colors.pink,
                //   label: 'Entry Sortir',
                //   labelStyle: TextStyle(fontSize: 18.0),
                //   onTap: () => print('THIRD CHILD'),
                //   onLongPress: () => print('THIRD CHILD LONG PRESS'),
                // ),

                //add more menu item children here
              ],
            ),
    );
  }
}

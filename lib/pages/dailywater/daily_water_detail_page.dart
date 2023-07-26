import 'package:fish/controllers/daily_water/daily_water_breed_list_controller.dart';
import 'package:fish/controllers/daily_water/daily_water_detail_controller.dart';
import 'package:fish/pages/dailywater/daily_water_edit_page.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/daily_water/daily_water_controller.dart';
import '../../controllers/daily_water/daily_water_edit_controller.dart';
import '../../models/daily_water_model.dart';

class DailyWaterDetailPage extends StatefulWidget {
  const DailyWaterDetailPage({Key? key}) : super(key: key);

  @override
  State<DailyWaterDetailPage> createState() => _DailyWaterDetailPageState();
}

@override
class _DailyWaterDetailPageState extends State<DailyWaterDetailPage> {
  final DailyWaterDetailController controller =
      Get.put(DailyWaterDetailController());
  final PondController pondController = Get.find();
  final DailyWaterBreedListController dailyWaterBreedListController =
      Get.find();
  final DailyWaterController dailyWaterController = Get.find();
  final DailyWaterEditController editController =
      Get.put(DailyWaterEditController());
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getDailyWaterData(
        context, dailyWaterController.selectedDailyWater.value.id.toString());
  }

  @override
  void dispose() {
    controller.postDataLog(controller.fitur);
    dailyWaterController.getDailyWaterData(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget treatmentDataRecap() {
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
                  "kolam ${pondController.selectedPond.value.alias}",
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
              ],
            ),
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
                  "Masa Budidaya",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  dailyWaterBreedListController.selectedActivation.value
                      .getStringActivationDate(),
                  style: secondaryTextStyle.copyWith(
                    fontSize: 13,
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

    Widget titleRecap() {
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
                  "Data Kondisi Air",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: heavy,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => DailyWaterEditPage(), arguments: {
                          'pond': pondController.selectedPond.value,
                          'activation': dailyWaterBreedListController
                              .selectedActivation.value,
                          'dailywater':
                              dailyWaterController.selectedDailyWater.value
                        });
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(250, 40),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Edit Data',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () async {
                          // Get.back();
                          await controller.deleteDailyWaterData(
                              context,
                              dailyWaterController.selectedDailyWater.value.id
                                  .toString());
                          // controller.getWeek();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.restore_from_trash,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget dataTreatment() {
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
                  "Tanggal",
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  controller.dailyWaterfix[0].getGmtToNormalDate(),
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
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

    Widget detailTreatment() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    editDataPh(controller.dailyWaterfix[0], "pH");
                  },
                  child: Text(
                    "pH",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    editDataPh(controller.dailyWaterfix[0], "pH");
                  },
                  child: Text(
                    "${controller.dailyWaterfix[0].ph} " +
                        "${controller.dailyWaterfix[0].ph_desc}",
                    style: secondaryTextStyle.copyWith(
                      color: controller.dailyWaterfix[0].ph_desc == "normal"
                          ? Colors.green
                          : Colors.red.shade300,
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    editDataSuhu(controller.dailyWaterfix[0], "Suhu");
                  },
                  child: GestureDetector(
                    onTap: () {
                      editDataSuhu(controller.dailyWaterfix[0], "Suhu");
                    },
                    child: Text(
                      "Suhu Air",
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
                Text(
                  "${controller.dailyWaterfix[0].temperature} " + "°C",
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16,
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
                GestureDetector(
                  onTap: () {
                    editDataDo(controller.dailyWaterfix[0], "Do");
                  },
                  child: Text(
                    "Dissolved Oxygen",
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    editDataDo(controller.dailyWaterfix[0], "Do");
                  },
                  child: Text(
                    "${controller.dailyWaterfix[0].numDo} " +
                        "${controller.dailyWaterfix[0].numDo_desc}",
                    style: secondaryTextStyle.copyWith(
                      color: controller.dailyWaterfix[0].numDo_desc == "normal"
                          ? Colors.green
                          : controller.dailyWaterfix[0].numDo_desc ==
                                  "berbahaya"
                              ? Colors.red.shade300
                              : Colors.amber,
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Detail Kondisi Air Harian"),
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () async {
                // Get.back();

                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              treatmentDataRecap(),
              detail(),
              titleRecap(),
              dataTreatment(),
              detailTreatment(),
              SizedBox(
                height: 10,
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

  void editDataPh(DailyWater dailywater, String title) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Edit $title', style: TextStyle(color: Colors.white)),
              content: Container(
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
                  controller: controller.phController,
                )),
              ),
              backgroundColor: backgroundColor1,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Batal'),
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await editController.editDailyWaterDataOne(context, () {
                      Navigator.pop(context, 'Submit');
                    },
                        controller.phController.text,
                        dailywater.numDo.toString(),
                        dailywater.temperature.toString());
                    controller.getDailyWaterData(
                        context,
                        dailyWaterController.selectedDailyWater.value.id
                            .toString());
                  },
                  child: const Text('Submit'),
                ),
              ],
            ));
  }

  void editDataSuhu(DailyWater dailywater, String title) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Edit $title', style: TextStyle(color: Colors.white)),
              content: Container(
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
                  controller: controller.suhuController,
                )),
              ),
              backgroundColor: backgroundColor1,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Batal'),
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await editController.editDailyWaterDataOne(context, () {
                      Navigator.pop(context, 'Submit');
                    }, dailywater.ph.toString(), dailywater.numDo.toString(),
                        controller.suhuController.text);
                    controller.getDailyWaterData(
                        context,
                        dailyWaterController.selectedDailyWater.value.id
                            .toString());
                  },
                  child: const Text('Submit'),
                ),
              ],
            ));
  }

  void editDataDo(DailyWater dailywater, String title) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Edit $title', style: TextStyle(color: Colors.white)),
              content: Container(
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
                  controller: controller.doController,
                )),
              ),
              backgroundColor: backgroundColor1,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Batal'),
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await editController.editDailyWaterDataOne(context, () {
                      Navigator.pop(context, 'Submit');
                    }, dailywater.ph.toString(), controller.doController.text,
                        dailywater.numDo.toString());
                    controller.getDailyWaterData(
                        context,
                        dailyWaterController.selectedDailyWater.value.id
                            .toString());
                  },
                  child: const Text('Submit'),
                ),
              ],
            ));
  }
}

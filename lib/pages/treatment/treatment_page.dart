import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/pages/component/treatment_card.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:fish/pages/treatment/treatment_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class TreatmentpPage extends StatefulWidget {
  TreatmentpPage({Key? key}) : super(key: key);

  @override
  State<TreatmentpPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentpPage> {
  final TreatmentController controller = Get.put(TreatmentController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getTreatmentData(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget fishDataRecap() {
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
                  'Kolam Alpha',
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

    Widget listTreatment() {
      return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: defaultMargin, left: defaultMargin),
          child: Column(
            children: controller.listTreatmentTest
                .map(
                  (treatmentList) => TreatmentCard(
                      treatmentList: treatmentList,
                      activation: controller.activation,
                      pond: controller.pond),
                )
                .toList(),
          ));
    }

    Widget emptyListTreatment() {
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
                "Kolam belum pernah dilakukan treatment",
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
                "Silahkan masukan treatment",
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

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => TreatmentEntryPage(), arguments: {
                "pond": controller.pond,
                "activation": controller.activation
              });
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              controller.listTreatmentTest.isEmpty
                  ? emptyListTreatment()
                  : listTreatment(),
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
}

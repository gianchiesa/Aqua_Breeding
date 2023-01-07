import 'package:fish/models/fishDeath_model.dart';
import 'package:fish/pages/component/treatment_card.dart';
import 'package:fish/pages/treatment/treatment_controller.dart';
import 'package:fish/pages/treatment/treatment_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class TreatmentpPage extends StatelessWidget {
  const TreatmentpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TreatmentController controller = Get.put(TreatmentController());

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
            children: controller.listTreatment
                .map(
                  (treatmentList) => TreatmentCard(
                    treatmentList: treatmentList,
                  ),
                )
                .toList(),
          ));
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => TreatmentEntryPage(), arguments: controller.pond);
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              fishDataRecap(),
              listTreatment(),
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

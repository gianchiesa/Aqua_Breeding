import 'dart:developer';

import 'package:fish/pages/component/deactivation_list_input.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/pages/pond/deactivation_breed_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/pond_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeactivationBreedPage extends StatefulWidget {
  DeactivationBreedPage({Key? key}) : super(key: key);
  @override
  State<DeactivationBreedPage> createState() => _DeactivationBreedPageState();
}

class _DeactivationBreedPageState extends State<DeactivationBreedPage> {
  final DeactivationBreedController controller =
      Get.put(DeactivationBreedController());

  final DetailPondController detailPondController =
      Get.put(DetailPondController());
  final PondController pondController = Get.put(PondController());

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await controller.getPondActivations(
    //       pondId: controller.pond.id.toString());
    // });
    controller.getHarvestedBool(detailPondController.activations[0]);
  }

  @override
  Widget build(BuildContext context) {
    Widget activationButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            await controller.pondDeactivation(
              context,
              () {
                detailPondController.getPondActivation(context);
              },
            );
            pondController
                .updateSelectedPond(pondController.selectedPond.value.id);
            // detailPondController.isPondActive.value = false;
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Panen  ',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget DeactivationInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: detailPondController.activations.isEmpty
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: ((context, index) {
                  return DeactivationListCard(
                      fish:
                          detailPondController.activations[0].fishLive[index]);
                }),
                itemCount: detailPondController.activations[0].fishLive.length,
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
              'Jumlah Sample (Ekor) (Opsional)',
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
                    decoration: InputDecoration.collapsed(
                        hintText: 'ex: 20', hintStyle: subtitleTextStyle)),
              ),
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
              'Berat Rata-rata Ikan (Kg) (Opsional)',
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
                    FilteringTextInputFormatter.deny(RegExp(r'[-,\s]'))
                  ],
                  keyboardType: TextInputType.number,
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
                child: TextFormField(
                  style: primaryTextStyle,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp(r'[-,\s]'))
                  ],
                  controller: controller.fishLengthAvgController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 11', hintStyle: subtitleTextStyle),
                ),
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
                child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.undersizeController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 2', hintStyle: subtitleTextStyle),
                ),
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
                child: TextFormField(
                  style: primaryTextStyle,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  controller: controller.oversizeController,
                  decoration: InputDecoration.collapsed(
                      hintText: 'ex: 4', hintStyle: subtitleTextStyle),
                ),
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
              'Jumlah Ikan Normalsize (Ekor)(Opsional)',
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
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Obx(() {
      if (controller.isDeactivationProgress.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: Text("Panen Kolam ${controller.pond.alias}"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              DeactivationInput(),
              // waterHeightInput(),
              sampleAmountInput(),
              fishLengthAvgInput(),
              fishWightInput(),
              normalsizeInput(),
              undersizeInput(),
              oversizeInput(),
              activationButton(),
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

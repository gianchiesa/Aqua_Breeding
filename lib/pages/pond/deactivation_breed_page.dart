import 'dart:developer';

import 'package:fish/pages/component/deactivation_list_input.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:fish/pages/pond/deactivation_breed_controller.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
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
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            // Get.back();
            await controller.pondDeactivation(
              context,
              () {
                Navigator.pop(context);
              },
            );
            detailPondController.isPondActive.value = false;
            detailPondController.getPondActivation(context);
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

    return Obx(() {
      if (controller.isDeactivationProgress.value == false) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor2,
            title: const Text("Panen"),
          ),
          backgroundColor: backgroundColor1,
          body: ListView(
            children: [
              DeactivationInput(),
              // waterHeightInput(),
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

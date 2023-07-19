import 'package:fish/pages/component/fish_harvest_card.dart';
import 'package:fish/pages/component/fish_list_card.dart';
import 'package:fish/pages/pond/detail_pond_controller.dart';
import 'package:fish/pages/pond/edit_fish_controller.dart';
import 'package:fish/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EditFish extends StatelessWidget {
  const EditFish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditFishController ediFishController = Get.put(EditFishController());
    final DetailPondController detailPondController = Get.find();

    Widget amountFish() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detailPondController.selectedActivation.value.isFinish == false
                  ? "Jumlah Ikan (${detailPondController.selectedActivation.value.fishAmount.toString()} Ekor)"
                  : "Data Panen Ikan (${detailPondController.selectedActivation.value.fishAmount.toString()} Ekor)",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Column(
              children: detailPondController
                          .selectedActivation.value.isFinish ==
                      false
                  ? detailPondController.selectedActivation.value.fishLive!
                      .map(
                        (fish) => FishListCard(fish: fish),
                      )
                      .toList()
                  : detailPondController.selectedActivation.value.fishHarvested!
                      .map(
                        (fish) => FishHarvestCard(fish: fish),
                      )
                      .toList(),
            ),
          ],
        ),
      );
    }

    Widget EditFishForm() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                children: detailPondController
                    .selectedActivation.value.fishLive!
                    .map((fish) => Container(
                          margin: EdgeInsets.only(
                              top: defaultSpace,
                              right: defaultMargin,
                              left: defaultMargin),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fish.type!,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: backgroundColor2,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextFormField(
                                  controller: ediFishController
                                      .getTextController(fish.type!),
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  style: primaryTextStyle,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList()),
          ],
        ),
      );
    }

    Widget editFishButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () async {
            if (EditFishController.isEdit()) {
              ediFishController.editFish(context, () {
                Get.back();
              });
            } else {
              () {};
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Edit Jumlah Ikan',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
      // };
    }

    return Scaffold(
        backgroundColor: backgroundColor1,
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: const Text('Edit Jumlah Ikan'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () async {
              Get.back();
            },
          ),
        ),
        body: ListView(
          children: [amountFish(), EditFishForm(), editFishButton()],
        ));
  }
}

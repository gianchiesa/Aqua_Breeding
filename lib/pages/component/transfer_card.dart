import 'package:fish/models/fish_harvested.dart';
import 'package:fish/models/fish_transfer_model.dart';
import 'package:fish/controllers/fish_transfer/fish_transfer_list_controller.dart';
// import 'package:fish/pages/treatment/treatment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:fish/models/fish_transfer_model.dart';

import 'package:fish/models/pond_model.dart';

import 'package:fish/models/activation_model.dart';

import '../fish_transfer/fish_transfer_detail_page.dart';
import 'list_fish.dart';

class TransferCard extends StatelessWidget {
  final Activation? activation;
  final Pond? pond;
  final FishTransfer? transferList;
  final TransferController transferController = Get.put(TransferController());
  TransferCard({Key? key, this.transferList, this.activation, this.pond})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FishHarvest> fish = transferList!.fishTransfer!;
    print(fish);
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailSortirPage(), arguments: {
          "sortir": transferList,
          "activation": activation,
          "pond": pond,
        });
        transferController.postDataLog(transferController.fitur);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: defaultMargin,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      transferList!.getGmtToNormalDate().toString(),
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14,
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
                      "Jenis Transfer",
                      style: primaryTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    transferList!.destination_activation_id == activation!.id
                        ? Text(
                            "Transfer Masuk",
                            style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                                color: Colors.green),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : Text(
                            "Transfer Keluar",
                            style: secondaryTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                                color: Colors.red.shade400),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Jenis Ikan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                ListView(
                  shrinkWrap: true,
                  children: fish.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${e.type}: ${e.amount!.abs().toString()}",
                          style: secondaryTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

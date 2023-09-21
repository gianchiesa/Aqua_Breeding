import 'package:fish/models/activation_model.dart';
import 'package:fish/models/fishGrading_model.dart';
import 'package:fish/models/pond_model.dart';
import 'package:fish/pages/component/list_fish.dart';
import 'package:fish/pages/grading/grading_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/pages/grading/detail_grading_page.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class GradingCard extends StatelessWidget {
  final List<dynamic>? fishList;
  final String? date;
  final String? type;
  final String? sampleAmount;
  final String? sampleWeight;
  final String? sampleLength;
  final String? fcr;

  GradingCard({
    Key? key,
    required this.fishList,
    this.date,
    this.type,
    this.sampleAmount,
    this.sampleWeight,
    this.sampleLength,
    this.fcr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(fishList);
    return Container(
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
            children: [
              Text(
                date!,
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                type!,
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Divider(color: Colors.white),
          Column(
            children: fishList!.map((fish) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fish["type"],
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: medium,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "${fish["amount"]} Ekor",
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              );
            }).toList(),
          ),
          Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Jumlah Sample",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                sampleAmount! + " Ekor",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Bobot Sample",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                sampleWeight! + " Kg",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rata-rata panjang sample",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                sampleLength! + " cm",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FCR",
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                fcr!,
                style: primaryTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: bold,
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
}

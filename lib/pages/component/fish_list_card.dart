import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';

import 'package:fish/theme.dart';

class FishListCard extends StatelessWidget {
  final Fish fish;

  const FishListCard({Key? key, required this.fish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: defaultMargin / 2,
      ),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: primaryColor),
        color: transparentColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                fish.type!,
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "${fish.amount.toString()} Ekor",
                style: secondaryTextStyle.copyWith(
                  fontSize: 14,
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

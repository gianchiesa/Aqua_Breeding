import 'package:flutter/material.dart';

import 'package:fish/theme.dart';

class FishCard extends StatelessWidget {
  final String? title;
  final num? value;
  final String? image;

  const FishCard({Key? key, this.title = '', this.value = 0, this.image = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      margin: EdgeInsets.only(
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffECEDEF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                child: Image(
                  image: AssetImage(this.image!),
                  width: 150,
                  height: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${this.value!.toStringAsFixed(3)} Kg',
                  style: priceTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

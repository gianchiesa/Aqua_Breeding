import 'package:fish/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 160,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo.png',
                ),
              ),
            ),
          ),
          Text(
            "Fishery+",
            style: blueTextStyle.copyWith(
              fontSize: 26,
              fontWeight: bold,
            ),
          ),
          Text(
            "by JFT",
            style: secondaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(
            color: secondaryColor,
          ),
        ]),
      ),
    );
  }
}

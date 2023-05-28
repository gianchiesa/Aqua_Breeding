import 'dart:convert';
import 'dart:developer';

import 'package:fish/controllers/authentication/register_controller.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controllers/authentication/profile_controller.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logov2.png',
                ),
              ),
            ),
          ),
          Text(
            "Assistive Aquaculture Breeding Management",
            textAlign: TextAlign.center,
            style: blueTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          Text(
            "by Aquaculture Tech",
            style: secondaryTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ]),
      );
    }

    Widget footer() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Profile",
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sudah punya akun?",
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Login',
                  style: blueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ]),
      );
    }

    Widget profileList() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.person,
                color: secondaryColor,
              ),
              title: Text(
                controller.breeder[0].name!.capitalizeFirst!,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.teal.shade900),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.water,
                color: secondaryColor,
              ),
              title: Text(
                controller.breeder[0].farm_name!.capitalizeFirst!,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.teal.shade900),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.place,
                color: secondaryColor,
              ),
              title: Text(
                controller.breeder[0].address!,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.teal.shade900),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: secondaryColor,
              ),
              title: Text(
                controller.breeder[0].phone!,
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.teal.shade900),
              ),
            ),
          ),
        ],
      );
    }

    Widget logoutButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin:
            EdgeInsets.only(top: 12, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            // Get.back();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
            controller.deleteToken();

            // controller.getWeek();
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Logout',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            // Get.back();
            // register();
            // controller.getWeek();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Submit',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return Obx(() {
      if (controller.isLoading.value == false) {
        return Scaffold(
          backgroundColor: backgroundColor2,
          body: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              logo(),
              SizedBox(
                height: 16,
              ),
              profileList(),
              logoutButton(),
              SizedBox(
                height: 8,
              ),
              // footer(),
              // submitButton(),
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
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: backgroundColor2,
    //       title: const Text("Entry Sortir"),
    //     ),
    //     backgroundColor: backgroundColor1,
    //     body: PageView(
    //       physics: const NeverScrollableScrollPhysics(),
    //       controller: pageController,
    //       children: [
    //         ListView(
    //           children: [
    //             SizedBox(
    //               height: 10,
    //             ),
    //             footer(),
    //             formInput(),
    //             SizedBox(
    //               height: 10,
    //             ),
    //           ],
    //         ),
    //         ListView(
    //           children: [
    //             SizedBox(
    //               height: 10,
    //             ),
    //             footer(),
    //             formInput(),
    //             SizedBox(
    //               height: 10,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ));
  }
}

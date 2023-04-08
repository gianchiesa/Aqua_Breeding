import 'dart:convert';
import 'dart:developer';

import 'package:fish/controllers/authentication/register_controller.dart';
import 'package:fish/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fish/service/url_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../component/login_card_input.dart';
import '../component/register_input.dart';
import '../component/register_input_next.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late SharedPreferences prefs;
  final RegisterController controller = Get.put(RegisterController());

  final pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  void initState() {
    super.initState();
    initSharedPrefs();
    controller.getFarmData();
  }

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
    inspect(prefs);
  }

  void register() async {
    final response = await http.post(
      Uri.parse(Urls.register),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "username": controller.usernameController.text,
        "password": controller.passwordController.text,
        "nik": controller.nikController.text,
        "name": controller.nameController.text,
        "phone": controller.phoneController.text,
        "hasFarm": controller.hasFarmController.selected.value,
        "farm_id": controller.farmIdSelected,
        "farm_name": controller.farmnameController.text,
        "breeder": controller.breedercountController.text,
        "address": controller.addressController.text,
        "coordinate": controller.coordinateController.text
      },
    );
    var data = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      var myToken = data['access_token'];
      prefs.setString('token', myToken);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
      print(response.body);
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
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
                  controller: controller.usernameController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'ex: 20',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
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
                  controller: controller.passwordController,
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget formInput() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return RegisterInputCard(
              registerfunc: register,
              pageController: pageController,
            );
          }),
          itemCount: 1,
        ),
      );
    }

    Widget form2Input() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultSpace, right: defaultMargin, left: defaultMargin),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: ((context, index) {
            return RegisterNextInputCard(
              registerfunc: register,
              pageController: pageController,
            );
          }),
          itemCount: 1,
        ),
      );
    }

    Widget logo() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/logo.png',
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
          SizedBox(
            height: 10,
          ),
        ]),
      );
    }

    Widget footer() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Register",
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

    Widget submitButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
            top: defaultSpace * 3, right: defaultMargin, left: defaultMargin),
        child: TextButton(
          onPressed: () {
            // Get.back();
            register();
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
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    footer(),
                    formInput(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    footer(),
                    form2Input(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ));
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

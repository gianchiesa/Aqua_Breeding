import 'package:fish/pages/component/tabviewwater.dart';
import 'package:fish/pages/dashboard_controller.dart';

import 'package:fish/pages/home/home_page.dart';
import 'package:fish/pages/component/tabviewwater.dart';
import 'package:fish/pages/pond/pond_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fish/theme.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: backgroundColor1,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                PondPage(),
                // GradingPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Color(0xff808191),
            selectedItemColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor3,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/home_secondary.png',
                    width: 25,
                    color: controller.tabIndex == 0
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/pond_secondary.png',
                    width: 25,
                    color: controller.tabIndex == 1
                        ? primaryColor
                        : Color(0xff808191),
                  ),
                ),
                label: 'Kolam',
              ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: EdgeInsets.only(
              //       top: 20,
              //       bottom: 5,
              //     ),
              //     child: Image.asset(
              //       'assets/water_secondary.png',
              //       width: 25,
              //       color: controller.tabIndex == 2
              //           ? primaryColor
              //           : Color(0xff808191),
              //     ),
              //   ),
              //   label: 'Air',
              // ),
              // BottomNavigationBarItem(
              //   icon: Container(
              //     margin: EdgeInsets.only(
              //       top: 20,
              //       bottom: 5,
              //     ),
              //     child: Image.asset(
              //       'assets/scale_secondary.png',
              //       width: 25,
              //       color: controller.tabIndex == 3
              //           ? primaryColor
              //           : Color(0xff808191),
              //     ),
              //   ),
              //   label: '',
              // ),
            ],
          ),
        );
      },
    );
  }
}

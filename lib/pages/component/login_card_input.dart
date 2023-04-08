import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';

import '../../controllers/authentication/login_controller.dart';

class LoginInputCard extends StatelessWidget {
  final VoidCallback loginfunc;
  LoginInputCard({Key? key, required this.loginfunc}) : super(key: key);
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor1,
        boxShadow: [
          BoxShadow(
            color: backgroundColor3,
            blurRadius: 4,
            offset: Offset(2, 8), // Shadow position
          ),
        ],
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
        top: defaultMargin / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Username',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                width: 6,
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
            child: Center(child: Obx(() {
              return TextFormField(
                style: primaryTextStyle,
                onChanged: controller.usernameChanged,
                onTap: controller.valusername,
                controller: controller.usernameController,
                decoration: controller.validateusername.value == true
                    ? controller.username == ''
                        ? InputDecoration(
                            errorText: 'username tidak boleh kosong',
                            isCollapsed: true)
                        : null
                    : null,
              );
            })),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                width: 6,
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
            child: Center(child: Obx(() {
              return TextFormField(
                style: primaryTextStyle,
                onChanged: controller.passwordChanged,
                onTap: controller.valpassword,
                controller: controller.passwordController,
                obscureText: true,
                decoration: controller.validatepassword.value == true
                    ? controller.password == ''
                        ? InputDecoration(
                            errorText: 'Password tidak boleh kosong',
                            isCollapsed: true)
                        : null
                    : null,
              );
            })),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin / 2,
            ),
            child: TextButton(
              onPressed: () {
                // Get.back();
                controller.usernameController.text == '' ||
                        controller.passwordController.text == ''
                    ? null
                    : loginfunc.call();
                // controller.getWeek();
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Login',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}

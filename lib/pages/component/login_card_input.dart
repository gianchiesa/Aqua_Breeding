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
                'BreederID',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: TextFormField(
              style: primaryTextStyle,
              onChanged: controller.usernameChanged,
              onTap: controller.valusername,
              controller: controller.usernameController,
              decoration: InputDecoration(
                  hintText: "Breeder ID",
                  hintStyle: TextStyle(color: Colors.grey),
                  isCollapsed: true),
            )),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 10),
              Obx(() {
                return controller.validateusername.value == true
                    ? controller.username == ''
                        ? Text(
                            'username tidak boleh kosong',
                            style: primaryTextStyle.copyWith(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : controller.usernameController.text.length < 5
                            ? Text(
                                'username kurang dari 5 karakter',
                                style: primaryTextStyle.copyWith(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            : Text('')
                    : SizedBox();
              }),
            ],
          ),
          SizedBox(height: 10),
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
                obscureText: controller.passwordHide.value,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.passVisibiity(controller.passwordHide.value);
                      },
                      icon: Icon(controller.passwordHide.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: Colors.white,
                    )),
              );
            })),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 10),
              Obx(() {
                return controller.validatepassword.value == true
                    ? controller.password == ''
                        ? Text(
                            'password tidak boleh kosong',
                            style: primaryTextStyle.copyWith(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        : controller.passwordController.text.length < 8
                            ? Text(
                                'username kurang dari 8 karakter',
                                style: primaryTextStyle.copyWith(
                                  color: Colors.red,
                                  fontSize: 14,
                                  fontWeight: medium,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              )
                            : SizedBox()
                    : SizedBox();
              }),
            ],
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
                controller.usernameController.text.length < 5 ||
                        controller.passwordController.text.length < 8
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

import 'package:fish/models/fish_model.dart';
import 'package:fish/pages/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fish/theme.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../controllers/authentication/register_controller.dart';

class RegisterInputCard extends StatelessWidget {
  final VoidCallback registerfunc;
  final PageController pageController;
  RegisterInputCard(
      {Key? key, required this.registerfunc, required this.pageController})
      : super(key: key);
  final RegisterController controller = Get.put(RegisterController());

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
                  fontSize: 16,
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
            height: 42,
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
                  fontSize: 16,
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
            height: 42,
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
                obscureText: true,
                controller: controller.passwordController,
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
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Nama',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
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
            height: 42,
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
                onChanged: controller.nameChanged,
                onTap: controller.valname,
                controller: controller.nameController,
                decoration: controller.validatename.value == true
                    ? controller.name == ''
                        ? InputDecoration(
                            errorText: 'Nama tidak boleh kosong',
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
                'No. HP',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
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
            height: 42,
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
                onChanged: controller.phoneChanged,
                onTap: controller.valphone,
                controller: controller.phoneController,
                decoration: controller.validatephone.value == true
                    ? controller.phone == ''
                        ? InputDecoration(
                            errorText: 'Phone tidak boleh kosong',
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
                'NIK',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
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
            height: 42,
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
                onChanged: controller.nikChanged,
                onTap: controller.valnik,
                controller: controller.nikController,
                decoration: controller.validatenik.value == true
                    ? controller.nik == ''
                        ? InputDecoration(
                            errorText: 'NIK tidak boleh kosong',
                            isCollapsed: true)
                        : null
                    : null,
              );
            })),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 42,
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin / 2,
            ),
            child: TextButton(
              onPressed: () {
                // Get.back();
                controller.usernameController.text == "" ||
                        controller.passwordController.text == "" ||
                        controller.phoneController.text == "" ||
                        controller.nameController.text == "" ||
                        controller.nikController.text == ""
                    ? null
                    : pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                // controller.getWeek();
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Berikutnya',
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
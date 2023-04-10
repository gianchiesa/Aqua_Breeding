import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final username = ''.obs;
  final password = ''.obs;
  final validateusername = false.obs;
  final validatepassword = false.obs;
  final passwordHide = true.obs;

  void passVisibiity(bool toogle) {
    if (toogle == true) {
      passwordHide.value = false;
    } else {
      passwordHide.value = true;
    }
  }

  void passwordChanged(String val) {
    password.value = val;
  }

  void usernameChanged(String val) {
    username.value = val;
  }

  void valusername() {
    validateusername.value = true;
  }

  void valpassword() {
    validatepassword.value = true;
  }

  Future<void> deleteToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

import 'dart:async';
import 'package:fish/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/breeder_model.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  final breeder = <Breeder>[].obs;

  @override
  void onInit() async {
    getBreeder();
    super.onInit();
  }

  Future<void> deleteToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> getBreeder() async {
    isLoading.value = true;
    breeder.clear();
    Breeder breederData = await ProfileService().getBreeder();
    breeder.add(breederData);
    print(breeder);
    isLoading.value = false;
  }
}

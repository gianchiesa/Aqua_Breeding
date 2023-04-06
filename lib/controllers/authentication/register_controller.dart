import 'dart:async';
import 'package:fish/models/farm_model.dart';
import 'package:fish/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'farm_list_controller.dart';
import 'has_farm_controller.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController farmnameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController breedercountController = TextEditingController();
  TextEditingController coordinateController = TextEditingController();
  FarmListController farmlistController = FarmListController();
  HasFarmController hasFarmController = HasFarmController();
  RxList<String> listFarmName = List<String>.empty().obs;
  final listFarm = <Farm>[].obs;
  var farmIdSelected = "";
  bool farmRegistered = true;

  Future<void> getFarmData() async {
    isLoading.value = true;
    listFarmName.clear();
    List<Farm> farmData = await UserService().getFarm();
    listFarmName.add('Pilih Tempat Budidaya');
    for (var i in farmData) {
      listFarm.add(i);
      listFarmName.add(i.farm_name.toString());
    }
    isLoading.value = false;
  }

  void getFarmId(String farmname) {
    isLoading.value = true;
    for (var i in listFarm) {
      if (i.farm_name == farmname) {
        farmIdSelected = i.id.toString();
      }
    }
    isLoading.value = false;
  }

  Future<void> deleteToken() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

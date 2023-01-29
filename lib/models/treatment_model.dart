import 'dart:ffi';

import 'package:intl/intl.dart';

class Treatment {
  String? id;
  String? activation_id;
  num? salt;
  String? type;
  num? probiotic;
  num? water;
  num? carbohydrate;
  String? carbohydrate_type;
  String? desc;
  String? treatmentAt;

  Treatment(
      {this.id,
      this.salt,
      this.type,
      this.probiotic,
      this.water,
      this.carbohydrate,
      this.desc,
      this.carbohydrate_type,
      this.activation_id,
      this.treatmentAt});

  // Treatment.fromJson(Map<String, dynamic> json) {
  //   salt = json['salt'];
  //   type = json['treatment_type'];
  //   probiotic = json['probiotic_culture'];
  // }
  factory Treatment.fromJson(Map<String, dynamic> json) {
    return Treatment(
        id: json['id'],
        salt: json['salt'],
        type: json['treatment_type'],
        probiotic: json['probiotic_culture'],
        water: json['water_change'],
        desc: json['description'],
        carbohydrate: json['carbohydrate'],
        carbohydrate_type: json['carbohydrate_type'],
        activation_id: json['pond_activation_id'],
        treatmentAt: json["treatment_at"]);
  }
  String getGmtToNormalDate() {
    String stringDate = treatmentAt!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
    return newStringDate;
  }

  // static List<Treatment> fromJsonList(List<dynamic> list) {
  //   List<Treatment> treatmentList = [];
  //   for (var item in list) {
  //     treatmentList.add(Treatment.fromJson(item));
  //   }
  //   return treatmentList;
  // }
}

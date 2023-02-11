import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// enum PondStatus {
//   active,
//   nonActive,
//   close,
// }

class WeeklyWater {
  String? id;
  String? pondId;
  String? activationId;
  num? ammonia;
  num? floc;
  num? nitrite;
  num? nitrate;
  num? hardness;
  num? week;
  String? floc_desc;
  String? ammonia_desc;
  String? hardness_desc;
  String? nitrate_desc;
  String? nitrite_desc;
  String? weeklywater_at;

  WeeklyWater(
      {required this.id,
      this.pondId,
      this.activationId,
      this.floc,
      this.floc_desc,
      this.ammonia,
      this.ammonia_desc,
      this.nitrate,
      this.nitrate_desc,
      this.nitrite,
      this.nitrite_desc,
      this.hardness,
      this.hardness_desc,
      this.week,
      this.weeklywater_at});

  factory WeeklyWater.fromJson(Map<String, dynamic> json) {
    return WeeklyWater(
        id: json['_id'],
        pondId: json['pond_id'],
        activationId: json['pond_activation_id'],
        floc: json['floc'],
        nitrate: json['nitrate'],
        nitrite: json['nitrite'],
        ammonia: json['ammonia'],
        hardness: json['hardness'],
        floc_desc: json['floc_desc'],
        nitrate_desc: json['nitrate_desc'],
        nitrite_desc: json['nitrite_desc'],
        ammonia_desc: json['ammonia_desc'],
        hardness_desc: json['hardness_desc'],
        week: json['week'],
        weeklywater_at: json['weeklywater_at']);
  }
  String getGmtToNormalDate() {
    String stringDate = weeklywater_at!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
    return newStringDate;
  }

  String getDayNameDate() {
    String stringDate = weeklywater_at!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("EEEE").format(dateTime);
    return newStringDate;
  }
}

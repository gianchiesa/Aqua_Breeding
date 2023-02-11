import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// enum PondStatus {
//   active,
//   nonActive,
//   close,
// }

class DailyWaterAvg {
  num? ph;
  num? numDo;
  num? temperature;
  num? week;

  DailyWaterAvg({this.numDo, this.temperature, this.week, this.ph});

  factory DailyWaterAvg.fromJson(Map<String, dynamic> json) {
    return DailyWaterAvg(
      ph: json['ph'],
      numDo: json['do'],
      temperature: json['temperature'],
      week: json['week'],
    );
  }
}

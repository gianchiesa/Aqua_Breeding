import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// enum PondStatus {
//   active,
//   nonActive,
//   close,
// }

class DailyWater {
  String? id;
  String? pondId;
  String? activationId;
  num? ph;
  num? numDo;
  num? temperature;
  num? week;
  String? ph_desc;
  String? numDo_desc;
  String? dailywater_at;

  DailyWater(
      {required this.id,
      this.pondId,
      this.activationId,
      this.numDo,
      this.numDo_desc,
      this.temperature,
      this.week,
      this.ph,
      this.ph_desc,
      this.dailywater_at});

  factory DailyWater.fromJson(Map<String, dynamic> json) {
    return DailyWater(
        id: json['_id'],
        pondId: json['pond_id'],
        activationId: json['pond_activation_id'],
        ph: json['ph'],
        numDo: json['do'],
        temperature: json['temperature'],
        week: json['week'],
        ph_desc: json['ph_desc'],
        numDo_desc: json['do_desc'],
        dailywater_at: json['dailywater_at']);
  }
  String getGmtToNormalDate() {
    String stringDate = dailywater_at!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
    return newStringDate;
  }

  String getDayNameDate() {
    String stringDate = dailywater_at!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("EEEE").format(dateTime);
    return newStringDate;
  }

//   static DateTime stringToDate(String dateString) {
//     DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
//     return parseDate;
//   }

//   Color getColor() {
//     PondStatus pondStatus = this.pondStatus;
//     switch (pondStatus) {
//       case PondStatus.active:
//         return Colors.green;
//       case PondStatus.nonActive:
//         return Colors.red.shade300;
//       case PondStatus.close:
//         return Colors.amber;
//       default:
//         return Colors.red.shade300;
//     }
//   }

//   String getFishAlive() {
//     if (isActive == false) {
//       return '-';
//     } else {
//       return fishAlive.toString();
//     }
//   }

//   String getLastActivationDate() {
//     if (isActive == false) {
//       return '-';
//     } else {
//       return lastActivationDate!;
//     }
//   }

//   String getGmtToNormalDate() {
//     String stringDate = buildAt!;
//     DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
//     String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
//     return newStringDate;
//   }
// }

// extension PondStatusConverter on PondStatus {
//   static PondStatus toEnum(String? status) {
//     switch (status) {
//       case 'Aktif':
//         return PondStatus.active;
//       case 'Tidak Aktif':
//         return PondStatus.nonActive;
//       case 'Panen':
//         return PondStatus.close;
//       default:
//         return PondStatus.nonActive;
//     }
//   }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum PondStatus {
  active,
  nonActive,
  close,
}

class string {}

class Pond {
  String? id;
  int? idInt;
  String? alias;
  String? location;
  String? shape;
  String? material;
  num? length;
  num? width;
  num? diameter;
  num? height;
  num? area;
  num? volume;
  String? buildAt;
  String? imageLink;
  bool? isActive;
  num? fishAlive;
  String? lastActivationDate;
  String? rangeFromLastActivation;
  PondStatus pondStatus;
  String? pondStatusStr;
  String? pondPhDesc;
  num? pondPh;
  String? pondDoDesc;
  num? pondDo;
  num? pondTemp;
  String? status;

  Pond({
    required this.id,
    required this.idInt,
    required this.alias,
    required this.location,
    required this.shape,
    required this.material,
    required this.isActive,
    required this.pondStatus,
    this.length,
    this.width,
    this.diameter,
    this.height,
    this.area,
    this.volume,
    this.buildAt,
    this.imageLink,
    this.fishAlive,
    this.lastActivationDate,
    this.rangeFromLastActivation,
    this.pondStatusStr,
    this.pondPh,
    this.pondPhDesc,
    this.pondDo,
    this.pondDoDesc,
    this.pondTemp,
    this.status,
  });

  factory Pond.fromJson(Map<String, dynamic> json) {
    return Pond(
        id: json['_id'],
        idInt: json['id_int'],
        alias: json['alias'],
        location: json['location'],
        shape: json['shape'],
        material: json['material'],
        length: json['length'],
        width: json['width'],
        diameter: json['diameter'],
        height: json['height'],
        area: json['area'],
        volume: json['volume'],
        buildAt: json['build_at'],
        imageLink: json['image_link'],
        isActive: json['isActive'],
        fishAlive: json['fish_alive'] ?? 0,
        lastActivationDate: json['activation_date'] ?? "-",
        rangeFromLastActivation: json['isActive'] == false
            ? "-"
            : (DateTime.now()
                    .difference(stringToDate(json['activation_date']))
                    .inDays)
                .toString(),
        pondStatus: PondStatusConverter.toEnum(json["status"]),
        pondStatusStr: json["status"],
        pondPh: json["pondPh"],
        pondPhDesc: json["pondPhDesc"],
        pondDo: json["pondDo"],
        pondDoDesc: json["pondDoDesc"],
        pondTemp: json["pondTemp"],
        status: json["status"]);
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }

  Color getColor() {
    PondStatus pondStatus = this.pondStatus;
    switch (pondStatus) {
      case PondStatus.active:
        return Colors.green;
      case PondStatus.nonActive:
        return Colors.red.shade300;
      case PondStatus.close:
        return Colors.amber;
      default:
        return Colors.red.shade300;
    }
  }

  String getFishAlive() {
    if (isActive == false) {
      return '-';
    } else {
      return fishAlive.toString();
    }
  }

  String getLastActivationDate() {
    if (isActive == false) {
      return '-';
    } else {
      return lastActivationDate!;
    }
  }

  String getGmtToNormalDate() {
    String stringDate = buildAt!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
    return newStringDate;
  }
}

extension PondStatusConverter on PondStatus {
  static PondStatus toEnum(String? status) {
    switch (status) {
      case 'Aktif':
        return PondStatus.active;
      case 'Tidak Aktif':
        return PondStatus.nonActive;
      case 'Panen':
        return PondStatus.close;
      default:
        return PondStatus.nonActive;
    }
  }
}

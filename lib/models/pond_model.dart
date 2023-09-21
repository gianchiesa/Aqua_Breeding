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
  num? waterLevel;
  num? waterVolume;
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
    this.waterLevel = 0,
    this.waterVolume = 0,
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
        fishAlive: json['isActive'] == true
            ? json['last_activation']['total_fish_alive']
            : 0,
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
        pondPhDesc: getPondPhDescription(json["pondPh"]),
        pondDo: json["pondDo"],
        pondDoDesc: getPondDoDescription(json["pondDo"]),
        pondTemp: json["pondTemp"],
        waterLevel: json['isActive'] == true ? json['water_level'] : 0,
        waterVolume: json['isActive'] == true ? json['water_volume'] : 0,
        status: json["status"]);
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }

  static String getPondPhDescription(num pondPh) {
    if (pondPh < 6 || pondPh > 8) {
      return 'Berbahaya';
    }
    return "Normal";
  }

  Color getPondPhColor() {
    if (pondPh! < 6 || pondPh! > 8) {
      return Colors.red.shade300;
    }
    return Colors.green;
  }

  static String getPondDoDescription(num pondDo) {
    if (pondDo < 3 || pondDo > 7.5) {
      return 'Berbahaya';
    }
    if (pondDo < 4 || pondDo > 6) {
      return 'Semi Berbahaya';
    }
    return "Normal";
  }

  Color getPondDoColor() {
    if (pondDo! < 3 || pondDo! > 7.5) {
      return Colors.red.shade300;
    }
    if (pondDo! < 4 || pondDo! > 6) {
      return Colors.amber;
    }
    return Colors.green;
  }

  String getStringEydDate(String strDate) {
    String result = '';
    DateTime date = DateFormat("dd-MM-yyyy").parse(strDate);
    result = DateFormat("dd MMMM yyyy").format(date);
    return result;
  }

  String getLastActivationDateEYD() => getStringEydDate(lastActivationDate!);

  String getRatioVolumePerFishAlive() {
    if (isActive == false) {
      return '0';
    }
    try {
      String result = (waterLevel! * 1000 / fishAlive!).toStringAsFixed(2);
      return result;
    } catch (e) {
      return '';
    }
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

import 'package:fish/models/fish_harvested.dart';
import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Activation {
  String? id;
  int? idInt;
  bool? isFinish;
  num? waterLevel;
  DateTime? activationAt;
  DateTime? deactivationAt;
  num? totalFishHarvested;
  num? totalWeightHarvested;
  num? consOver;
  num? consUnder;
  int? fishAmount;
  List<Fish>? fishLive;
  List<Fish>? fishDeath;
  List<FishHarvest>? fishHarvested;
  num? survivalRate;
  num? fcr;

  Activation({
    required this.id,
    required this.idInt,
    required this.isFinish,
    required this.waterLevel,
    required this.activationAt,
    this.deactivationAt,
    this.totalFishHarvested,
    this.totalWeightHarvested,
    this.fishHarvested,
    this.consOver,
    this.consUnder,
    this.fishAmount,
    this.fishLive,
    this.fishDeath,
    this.survivalRate,
    this.fcr,
  });

  factory Activation.fromJson(Map<String, dynamic> json) {
    print(json);
    return Activation(
      id: json['_id'],
      idInt: json['id_int'],
      isFinish: json['isFinish'],
      waterLevel: json['water_level'],
      activationAt:
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['activated_at']),
      deactivationAt: json['isFinish'] == true
          ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['deactivated_at'])
          : null,
      totalFishHarvested: json['total_fish_harvested'],
      totalWeightHarvested: json['total_weight_harvested'],
      fishHarvested: FishHarvest.fromJsonList(json['fish_harvested']),
      consOver: json['constanta_oversize'],
      consUnder: json['constanta_undersize'],
      fishAmount: json['total_fish'],
      fishLive: Fish.fromJsonList(json['fish_live']),
      fishDeath: Fish.fromJsonList(json['fish_death']),
      survivalRate: json['survival_rate'],
      fcr: json['fcr'],
    );
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }

  Color getColor() {
    switch (isFinish) {
      case false:
        return Colors.green;
      case true:
        return Colors.red.shade300;
      default:
        return Colors.red.shade300;
    }
  }

  String getStatus() {
    switch (isFinish) {
      case false:
        return "Berjalan";
      case true:
        return "Selesai";
      default:
        return "Selesai";
    }
  }

  String getStringActivationDate() =>
      DateFormat("dd-MM-yyyy").format(activationAt!);

  String getStringDeactivationDate() {
    print(deactivationAt);
    if (isFinish == false) {
      return "-";
    }
    return DateFormat("dd-MM-yyyy").format(deactivationAt!);
  }

  num getRangeActivation() {
    print(deactivationAt);
    if (isFinish == false) {
      print(DateTime.now());
      print(activationAt);
      return DateTime.now().difference(activationAt!).inDays;
    }
    return deactivationAt!.difference(activationAt!).inDays;
  }
}

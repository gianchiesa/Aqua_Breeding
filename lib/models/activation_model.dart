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
  int? fishAmount;
  List<Fish>? fishLive;
  double? totalWeightFishAlive;
  List<Fish>? fishDeath;
  List<FishHarvest>? fishHarvested;
  num? survivalRate;
  num? fcr;
  DateTime? fcrUpdate;
  num? feedDose;
  DateTime? lastFeedDose;

  Activation({
    required this.id,
    required this.isFinish,
    required this.waterLevel,
    required this.activationAt,
    this.deactivationAt,
    this.totalFishHarvested,
    this.totalWeightHarvested,
    this.fishHarvested,
    this.fishAmount,
    this.fishLive,
    this.totalWeightFishAlive = 0,
    this.fishDeath,
    this.survivalRate,
    this.fcr,
    this.fcrUpdate,
    this.feedDose,
    this.lastFeedDose,
  });

  factory Activation.fromJson(Map<String, dynamic> json) {
    print(json);
    return Activation(
      id: json['_id'],
      isFinish: json['isFinish'],
      waterLevel: json['water_level'],
      activationAt:
          DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['activated_at']),
      deactivationAt: json['isFinish'] == true
          ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['deactivated_at'])
          : null,
      fishLive: Fish.fromJsonList(json['fish_live']),
      totalWeightFishAlive: calculateTotalWeight(json['fish_live']),
      fishAmount: json['total_fish'],
      totalFishHarvested: 0,
      totalWeightHarvested: 0,
      fishHarvested: FishHarvest.fromJsonList(json['fish_harvested']),
      fishDeath: Fish.fromJsonList(json['fish_death']),
      survivalRate: json['survival_rate'],
      fcr: json['fcr'],
      fcrUpdate: DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['fcr_update']),
      feedDose: json['feed_dose'],
      lastFeedDose: json['last_feed_dose'] != null
          ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['last_feed_dose'])
          : null,
    );
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }

  static calculateTotalWeight(List<dynamic> fishData) {
    double totalWeight = 0.0;
    // print(fishData);
    try {
      for (var fish in fishData) {
        totalWeight += (fish['amount'] * fish['weight']);
      }
    } catch (e) {
      return totalWeight;
    }

    return totalWeight;
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
      DateFormat('EEEE, d MMM yyyy', 'id_ID').format(activationAt!);

  String getStringDeactivationDate() {
    print(deactivationAt);
    if (isFinish == false) {
      return "-";
    }
    return DateFormat('EEEE, d MMM yyyy', 'id_ID').format(deactivationAt!);
  }

  String getStringFcrUpdate() =>
      DateFormat('EEEE, d MMM yyyy', 'id_ID').format(fcrUpdate!);

  String getStringLastFeedDose() {
    try {
      return DateFormat('EEEE, d MMM yyyy', 'id_ID').format(lastFeedDose!);
    } catch (e) {
      return '-';
    }
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

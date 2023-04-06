import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Farm {
  String? id;
  String? farm_name;
  String? breeder;
  String? address;
  String? coordinate;

  Farm({
    required this.id,
    required this.farm_name,
    required this.breeder,
    required this.address,
    required this.coordinate,
  });

  factory Farm.fromJson(Map<String, dynamic> json) {
    return Farm(
        id: json['_id'],
        farm_name: json['farm_name'],
        breeder: json['breeder'],
        address: json['address'],
        coordinate: json['coordinate']);
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }
}

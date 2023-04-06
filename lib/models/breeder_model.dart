import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Breeder {
  String? id;
  String? farm_id;
  String? name;
  String? username;
  String? farm_name;
  String? nik;
  String? phone;
  String? address;

  Breeder({
    required this.id,
    required this.farm_id,
    required this.name,
    required this.username,
    required this.farm_name,
    required this.address,
    required this.nik,
    required this.phone,
  });

  factory Breeder.fromJson(Map<String, dynamic> json) {
    return Breeder(
      id: json['_id'],
      farm_id: json['farm_id'],
      farm_name: json['farm_name'],
      address: json['address'],
      name: json['name'],
      username: json['username'],
      nik: json['nik'],
      phone: json['phone'],
    );
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }
}

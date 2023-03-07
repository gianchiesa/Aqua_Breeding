import 'package:fish/models/fish_harvested.dart';
import 'package:intl/intl.dart';
import 'package:fish/models/fish_model.dart';

class FishTransfer {
  String? id;
  String? origin_pond_id;
  String? origin_activation_id;
  String? destination_pond_id;
  String? destination_activation_id;
  String? transfer_method;
  String? transfer_type;
  num? sampleLong;
  num? sampleWeight;
  List<FishHarvest>? fishTransfer;
  String? transferAt;

  FishTransfer({
    required this.id,
    required this.origin_pond_id,
    required this.origin_activation_id,
    required this.destination_pond_id,
    required this.destination_activation_id,
    required this.transfer_type,
    required this.transfer_method,
    required this.sampleLong,
    required this.sampleWeight,
    required this.fishTransfer,
    this.transferAt,
  });

  factory FishTransfer.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishTransfer(
      id: json['_id'],
      origin_pond_id: json['origin_pond_id'],
      origin_activation_id: json['origin_activation_id'],
      destination_pond_id: json['destination_pond_id'],
      destination_activation_id: json['destination_activation_id'],
      transfer_method: json['transfer_method'],
      transfer_type: json['transfer_type'],
      sampleLong: json['sample_long'],
      sampleWeight: json['sample_weight'],
      fishTransfer: FishHarvest.fromJsonList(json['fish']),
      transferAt: json['transfer_at'],
    );
  }

  String getGmtToNormalDate() {
    String stringDate = transferAt!;
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(stringDate);
    String newStringDate = DateFormat("dd-MM-yyyy").format(dateTime);
    return newStringDate;
  }
}

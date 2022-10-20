import 'package:intl/intl.dart';

class FishDeath {
  String? id;
  String? diagnosis;
  String? fishType;
  num? deathAmount;
  DateTime? deathAt;

  FishDeath({
    required this.id,
    required this.diagnosis,
    required this.fishType,
    required this.deathAmount,
    required this.deathAt,
  });

  factory FishDeath.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishDeath(
      id: json['_id'],
      diagnosis: json['diagnosis'],
      fishType: json['fish']['fish_type'],
      deathAmount: json["fish"]['fish_amount'] * -1,
      deathAt: DateTime.tryParse(json['death_at']),
    );
  }

  static List<FishDeath> fromJsonList(List<dynamic> list) {
    List<FishDeath> fishDeaths = [];
    for (var item in list) {
      fishDeaths.add(FishDeath.fromJson(item));
    }
    return fishDeaths;
  }

  String getDate() => DateFormat('dd-MM-yyyy ').format(deathAt!);
}

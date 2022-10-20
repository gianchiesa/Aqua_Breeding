import 'package:intl/intl.dart';

class FishGrading {
  String? id;
  String? fishType;
  num? samplingAmount;
  num? avgFishWeight;
  num? avgFishLong;
  num? normalFish;
  num? oversizeFish;
  num? undersizeFish;
  DateTime? gradingAt;

  FishGrading({
    required this.id,
    required this.fishType,
    required this.samplingAmount,
    required this.avgFishWeight,
    this.avgFishLong,
    this.normalFish,
    this.oversizeFish,
    this.undersizeFish,
    this.gradingAt,
  });

  factory FishGrading.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishGrading(
      id: json['_id'],
      fishType: json['fish_type'],
      samplingAmount: json['sampling_amount'],
      avgFishWeight: json['avg_fish_weight'],
      avgFishLong: json['avg_fish_long'],
      normalFish: json['amount_normal_fish'],
      oversizeFish: json['amount_oversize_fish'],
      undersizeFish: json['amount_undersize_fish'],
      gradingAt: DateTime.tryParse(json['grading_at']),
    );
  }

  static List<FishGrading> fromJsonList(List<dynamic> list) {
    List<FishGrading> fishgradings = [];
    for (var item in list) {
      fishgradings.add(FishGrading.fromJson(item));
    }
    return fishgradings;
  }

  String getDate() => DateFormat('dd-MM-yyyy ').format(gradingAt!);
}

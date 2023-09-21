import 'package:intl/intl.dart';

class FishGrading {
  String? id;
  DateTime? gradingAt;
  String? type;
  List<dynamic>? fishList;
  num? sampleAmount;
  num? sampleWeight;
  num? sampleLength;
  num? fcr;

  FishGrading({
    required this.id,
    required this.gradingAt,
    required this.fishList,
    this.type,
    this.sampleAmount = 0,
    this.sampleWeight = 0,
    this.sampleLength = 0,
    this.fcr = 0,
  });

  factory FishGrading.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishGrading(
      id: json['_id'],
      gradingAt: DateTime.tryParse(json['grading_at']),
      fishList: json['fish'],
      type: json['event_desc'],
      sampleAmount: json['sample_amount'] ?? 0,
      sampleWeight: json['sample_weight'] ?? 0,
      sampleLength: json['sample_long'] ?? 0,
      fcr: json['fcr'] ?? 0,
    );
  }

  static List<FishGrading> fromJsonList(List<dynamic> list) {
    List<FishGrading> fishgradings = [];
    for (var item in list) {
      fishgradings.add(FishGrading.fromJson(item));
    }
    return fishgradings;
  }

  String getDate() =>
      DateFormat('EEEE, d MMM yyyy', 'id_ID').format(gradingAt!);
}

import 'package:intl/intl.dart';

class GradingChartData {
  num? avg_weight;
  String? fish_type;
  DateTime? date;

  GradingChartData({
    required this.avg_weight,
    required this.fish_type,
    required this.date,
  });

  factory GradingChartData.fromJson(Map<String, dynamic> json) {
    print(json);
    return GradingChartData(
      avg_weight: json["avg_fish_weight"],
      fish_type: json["fish_type"],
      date: DateTime.tryParse(json['grading_at']),
    );
  }

  static List<GradingChartData> fromJsonList(List<dynamic> list) {
    List<GradingChartData> gradingDatas = [];
    for (var item in list) {
      gradingDatas.add(GradingChartData.fromJson(item));
    }
    return gradingDatas;
  }

  String getDate() => DateFormat('dd-MM-yyyy').format(date!);
}

import 'package:intl/intl.dart';

class FishChartData {
  num? amount;
  String? date;

  FishChartData({
    required this.amount,
    required this.date,
  });

  factory FishChartData.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishChartData(
      amount: json['amount'],
      date: json['date'],
    );
  }

  static List<FishChartData> fromJsonList(List<dynamic> list) {
    List<FishChartData> fishLivedatas = [];
    for (var item in list) {
      fishLivedatas.add(FishChartData.fromJson(item));
    }
    return fishLivedatas;
  }

  // String getDate() => DateFormat('dd-MM-yyyy').format(date!);
}

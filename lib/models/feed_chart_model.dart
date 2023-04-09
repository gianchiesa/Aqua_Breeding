import 'package:intl/intl.dart';

class FeedChartData {
  num? amount;
  DateTime? date;

  FeedChartData({
    required this.amount,
    required this.date,
  });

  factory FeedChartData.fromJson(Map<String, dynamic> json) {
    print(json);
    return FeedChartData(
      amount: json["feed_dose"],
      date: DateTime.tryParse(json['date']),
    );
  }

  static List<FeedChartData> fromJsonList(List<dynamic> list) {
    List<FeedChartData> feedDatas = [];
    for (var item in list) {
      feedDatas.add(FeedChartData.fromJson(item));
    }
    return feedDatas;
  }

  String getDate() => DateFormat('dd-MM-yyyy').format(date!);
}

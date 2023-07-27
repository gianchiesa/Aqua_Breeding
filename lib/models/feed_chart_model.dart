import 'package:intl/intl.dart';

class FeedChartData {
  num? feeddose;
  String? date;

  FeedChartData({
    required this.feeddose,
    required this.date,
  });

  factory FeedChartData.fromJson(Map<String, dynamic> json) {
    print(json);
    return FeedChartData(
      feeddose: double.parse(json["feed_dose"]),
      date: json["date"],
    );
  }

  static List<FeedChartData> fromJsonList(List<dynamic> list) {
    List<FeedChartData> feedDatas = [];
    for (var item in list) {
      feedDatas.add(FeedChartData.fromJson(item));
    }
    return feedDatas;
  }

  // String getDate() => DateFormat('dd-MM-yyyy').format(date!);
}

import 'package:intl/intl.dart';

class FeedHistoryHourly {
  String? id;
  DateTime? date;
  num? totalFeedWeight;

  FeedHistoryHourly({
    required this.id,
    required this.date,
    required this.totalFeedWeight,
  });

  factory FeedHistoryHourly.fromJson(Map<String, dynamic> json) {
    return FeedHistoryHourly(
      id: json['_id'],
      date: DateTime.tryParse(json['feed_history_time']),
      totalFeedWeight: json['feed_dose'],
    );
  }

  static List<FeedHistoryHourly> fromJsonList(List<dynamic> list) {
    List<FeedHistoryHourly> feedHistorys = [];
    for (var item in list) {
      feedHistorys.add(FeedHistoryHourly.fromJson(item));
    }
    return feedHistorys;
  }

  String getDate() => DateFormat('dd-MM-yyyy ').format(date!);
  String getTime() => DateFormat.Hm().format(date!);
}

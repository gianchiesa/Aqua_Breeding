import 'package:intl/intl.dart';

class FeedHistoryDaily {
  DateTime? date;
  int? totalFeedWeight;
  int? totalFeed;

  FeedHistoryDaily({
    required this.date,
    required this.totalFeedWeight,
    required this.totalFeed,
  });

  factory FeedHistoryDaily.fromJson(Map<String, dynamic> json) {
    return FeedHistoryDaily(
      date: DateTime.utc(json['year'], json['month'], json['_id']),
      totalFeedWeight: json['total_feed'],
      totalFeed: json['total_feedhistory'],
    );
  }

  static List<FeedHistoryDaily> fromJsonList(List<dynamic> list) {
    List<FeedHistoryDaily> feedHistorys = [];
    for (var item in list) {
      feedHistorys.add(FeedHistoryDaily.fromJson(item));
    }
    return feedHistorys;
  }

  String getDayName() => DateFormat('EEEE').format(date!);
  String getDate() => DateFormat('yyyy-MM-dd').format(date!);
}

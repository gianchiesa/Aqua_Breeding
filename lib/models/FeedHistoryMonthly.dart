import 'package:intl/intl.dart';

class FeedHistoryMonthly {
  DateTime? date;
  int? totalFeedWeight;
  int? totalFeed;

  FeedHistoryMonthly({
    required this.date,
    required this.totalFeedWeight,
    required this.totalFeed,
  });

  factory FeedHistoryMonthly.fromJson(Map<String, dynamic> json) {
    return FeedHistoryMonthly(
      date: DateTime.utc(json['year'], json['_id']),
      totalFeedWeight: json['total_feed'],
      totalFeed: json['total_feedhistory'],
    );
  }

  static List<FeedHistoryMonthly> fromJsonList(List<dynamic> list) {
    List<FeedHistoryMonthly> fishes = [];
    for (var item in list) {
      fishes.add(FeedHistoryMonthly.fromJson(item));
    }
    return fishes;
  }

  String getMonthName() => DateFormat('MMM').format(date!);
  String getMonthNameFull() => DateFormat('MMMM').format(date!);

  String getMonth() => DateFormat('yyyy-MM').format(date!);
}

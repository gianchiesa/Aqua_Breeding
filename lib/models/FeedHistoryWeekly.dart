class FeedHistoryWeekly {
  DateTime? date;
  num? week;
  num? totalFeedWeight;
  num? totalFeed;

  FeedHistoryWeekly({
    required this.date,
    required this.week,
    required this.totalFeedWeight,
    required this.totalFeed,
  });

  factory FeedHistoryWeekly.fromJson(Map<String, dynamic> json) {
    return FeedHistoryWeekly(
      date: DateTime.utc(json['year'], json['month']),
      week: json['_id'],
      totalFeedWeight: json['total_feed'],
      totalFeed: json['total_feedhistory'],
    );
  }

  static List<FeedHistoryWeekly> fromJsonList(List<dynamic> list) {
    List<FeedHistoryWeekly> feedHistorys = [];
    for (var item in list) {
      feedHistorys.add(FeedHistoryWeekly.fromJson(item));
    }
    return feedHistorys;
  }
}

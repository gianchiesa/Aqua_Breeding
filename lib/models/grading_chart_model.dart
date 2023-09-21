import 'package:intl/intl.dart';

class FishWeightData {
  final DateTime date;
  final double totalWeightFish;

  FishWeightData({
    required this.date,
    required this.totalWeightFish,
  });

  factory FishWeightData.fromJson(Map<String, dynamic> json) {
    return FishWeightData(
      date: DateTime.parse(json['date']),
      totalWeightFish: json['total_weight_fish'].toDouble(),
    );
  }

  String getDate() => DateFormat('dd-MMM').format(date);
}

class FishFeedHistory {
  final DateTime date;
  final double totalFeedDose;

  FishFeedHistory({
    required this.date,
    required this.totalFeedDose,
  });

  factory FishFeedHistory.fromJson(Map<String, dynamic> json) {
    return FishFeedHistory(
      date: DateTime.parse(json['date']),
      totalFeedDose: json['total_feed_dose'].toDouble(),
    );
  }

  String getDate() => DateFormat('dd-MMM').format(date);
}

class FishGradingChart {
  final List<FishWeightData> listFishWeight;
  final List<FishFeedHistory> listFishFeedHistory;

  FishGradingChart({
    required this.listFishWeight,
    required this.listFishFeedHistory,
  });

  factory FishGradingChart.fromJson(Map<String, dynamic> json) {
    List<FishWeightData> fishWeightList = (json['list_fish_weight'] as List)
        .map((item) => FishWeightData.fromJson(item))
        .toList();

    List<FishFeedHistory> fishFeedList =
        (json['list_fish_feed_history'] as List)
            .map((item) => FishFeedHistory.fromJson(item))
            .toList();

    return FishGradingChart(
      listFishWeight: fishWeightList,
      listFishFeedHistory: fishFeedList,
    );
  }
}

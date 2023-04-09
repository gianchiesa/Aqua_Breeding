import 'package:intl/intl.dart';

class FishLiveData {
  num? amount;
  String? fishType;
  DateTime? date;

  FishLiveData({
    required this.amount,
    required this.fishType,
    required this.date,
  });

  factory FishLiveData.fromJson(Map<String, dynamic> json) {
    print(json);
    return FishLiveData(
      amount: json["fish"]['fish_amount'],
      fishType: json['fish']['fish_type'],
      date: DateTime.tryParse(json['death_at']),
    );
  }

  static List<FishLiveData> fromJsonList(List<dynamic> list) {
    List<FishLiveData> fishLivedatas = [];
    for (var item in list) {
      fishLivedatas.add(FishLiveData.fromJson(item));
    }
    return fishLivedatas;
  }

  String getDate() => DateFormat('dd-MM-yyyy').format(date!);
}

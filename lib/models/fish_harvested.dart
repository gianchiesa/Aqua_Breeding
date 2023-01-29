class FishHarvest {
  String? type;
  num? amount;
  num? weight;

  FishHarvest({this.type, this.amount, this.weight});

  factory FishHarvest.fromJson(Map<String, dynamic> json) {
    return FishHarvest(
        type: json['fish_type'],
        amount: json['fish_amount'],
        weight: json['fish_total_weight']);
  }

  static List<FishHarvest> fromJsonList(List<dynamic> list) {
    List<FishHarvest> fishes = [];
    for (var item in list) {
      fishes.add(FishHarvest.fromJson(item));
    }
    return fishes;
  }
}

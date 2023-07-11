import 'dart:convert';

class Fish {
  String? type;
  int? amount;
  double? weight;
  Fish({required this.type, this.amount, this.weight});

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      type: json['fish_type'],
      amount: json['fish_amount'] <= 0
          ? json['fish_amount'] * -1
          : json['fish_amount'],
    );
  }

  factory Fish.staticfromJson(Map<String, dynamic> json) {
    return Fish(
        type: json['type'],
        amount: int.parse(json['amount']),
        weight: double.parse(json["weight"]));
  }

  static List<Fish> fromJsonList(List<dynamic> list) {
    List<Fish> fishes = [];
    for (var item in list) {
      fishes.add(Fish.fromJson(item));
    }
    return fishes;
  }

  static List<Fish> createList(List<dynamic> data) {
    return List<Fish>.from(
        data.map<Fish>((e) => Fish.staticfromJson(json.decode(e))));
  }
}

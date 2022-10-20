class Fish {
  String? type;
  int? amount;

  Fish({
    required this.type,
    this.amount,
  });

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      type: json['fish_type'],
      amount: json['fish_amount'] <= 0
          ? json['fish_amount'] * -1
          : json['fish_amount'],
    );
  }

  static List<Fish> fromJsonList(List<dynamic> list) {
    List<Fish> fishes = [];
    for (var item in list) {
      fishes.add(Fish.fromJson(item));
    }
    return fishes;
  }
}

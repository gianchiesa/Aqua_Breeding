class FeedType {
  String? id;
  String? name;
  String? type;
  num? protein;
  num? carbohydrate;

  FeedType({
    required this.id,
    required this.name,
    required this.type,
    this.protein,
    this.carbohydrate,
  });

  factory FeedType.fromJson(Map<String, dynamic> json) {
    return FeedType(
      id: json['_id'],
      name: json['name'],
      type: json['feed_type'],
      protein: json['protein'],
      carbohydrate: json['carbohydrate'],
    );
  }

  static List<FeedType> fromJsonList(List<dynamic> list) {
    List<FeedType> feedtypes = [];
    for (var item in list) {
      feedtypes.add(FeedType.fromJson(item));
    }
    return feedtypes;
  }
}

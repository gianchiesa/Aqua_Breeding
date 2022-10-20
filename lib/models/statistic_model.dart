class StatisticModel {
  int? total_pond;
  int? active_pond;
  int? fish_live;
  int? fish_death;
  int? fish_harvested;
  int? total_feed_dose;
  num? fishes_weight_lele;
  num? fishes_weight_nilamerah;
  num? fishes_weight_nilahitam;
  num? fishes_weight_mas;
  num? fishes_weight_patin;
  int? ph_normal;
  int? ph_abnormal;
  int? do_normal;
  int? do_abnormal;
  int? floc_normal;
  int? floc_abnormal;

  StatisticModel(
      {this.total_pond,
      this.active_pond,
      this.fish_live,
      this.fish_death,
      this.fish_harvested,
      this.total_feed_dose,
      this.fishes_weight_lele,
      this.fishes_weight_nilamerah,
      this.fishes_weight_nilahitam,
      this.fishes_weight_mas,
      this.fishes_weight_patin,
      this.ph_normal,
      this.ph_abnormal,
      this.do_normal,
      this.do_abnormal,
      this.floc_normal,
      this.floc_abnormal});

  StatisticModel.fromJson(Map<String, dynamic> json) {
    total_pond = json['total_pond'];
    active_pond = json['active_pond'];
    fish_live = json['fish_live'];
    fish_death = json['fish_death'];
    fish_harvested = json['fish_harvested'];
    total_feed_dose = json['total_feed_dose'];
    fishes_weight_nilahitam = json['fishes_weight'][0]["amount"];
    fishes_weight_nilamerah = json['fishes_weight'][1]["amount"];
    fishes_weight_lele = json['fishes_weight'][2]["amount"];
    fishes_weight_patin = json['fishes_weight'][3]["amount"];
    fishes_weight_mas = json['fishes_weight'][4]["amount"];
    ph_normal = json['water_quality']['ph']['normal'];
    ph_abnormal = json['water_quality']['ph']['abnormal'];
    do_normal = json['water_quality']['do']['normal'];
    do_abnormal = json['water_quality']['do']['abnormal'];
    floc_normal = json['water_quality']['floc']['normal'];
    floc_abnormal = json['water_quality']['floc']['abnormal'];
  }
}

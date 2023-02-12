class Urls {
  // static const String baseUrl = 'http://jft.web.id/fishapi/api';
  static const String baseUrl = 'http://10.0.2.2:5000/api';

  // Home
  static const String statistic = '$baseUrl/statistic';

  // Pond
  static const String ponds = '$baseUrl/ponds';
  static String pond(String? pondId) => '$baseUrl/ponds/$pondId';

  // Activation
  static String activation(String? pondId) => '$baseUrl/ponds/status/$pondId';
  // Post Activation
  static String pondActivation(String? pondId) =>
      '$baseUrl/ponds/$pondId/activation';
  static String pondDeactivation(String? pondId) =>
      '$baseUrl/ponds/$pondId/closing';
  // Feed Type
  static const String feedType = '$baseUrl/feedtypes';

  // Feed History
  static const String feedhistorys = '$baseUrl/feedhistorys';
  static String feedHistoryMonthly(String? activationId) =>
      '$baseUrl/feedhistorys/month/$activationId';
  static String feedHistoryWeekly(String? activationId, month) =>
      '$baseUrl/feedhistorys/week/$activationId/$month';
  static String feedHistoryDaily(String? activationId, week) =>
      '$baseUrl/feedhistorys/day/$activationId/$week';
  static String feedHistory(String? activationId, date) =>
      '$baseUrl/feedhistorys/hour/$activationId/$date';

  // Fish Grading
  static const String fishGradings = '$baseUrl/fishgradings';
  static String fishGrading(String? activationId) =>
      '$baseUrl/fishgradings/activation/$activationId';

  // Fish Death
  static const String fishDeaths = '$baseUrl/fishdeath';
  static String fishDeath(String? activationId) =>
      '$baseUrl/fishdeath/activation/$activationId';

  //Treatment
  static const String treatment = '$baseUrl/pondtreatment';
  static String pondTreatment(String? activationId) =>
      '$baseUrl/fishdeath/activation/$activationId';

  //Water Quality
  static String dailyWater = '$baseUrl/dailywaterquality';
  static String weeklyWater = '$baseUrl/weeklywaterquality';

  static String dailyWaterbyid(String? dailywaterId) =>
      '$baseUrl/dailywaterquality/$dailywaterId';
}

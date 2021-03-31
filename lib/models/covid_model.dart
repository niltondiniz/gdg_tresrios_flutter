class CovidModel {
  String city;
  int cityIbgeCode;
  String date;
  int epidemiologicalWeek;
  int estimatedPopulation;
  int estimatedPopulation2019;
  bool isLast;
  bool isRepeated;
  int lastAvailableConfirmed;
  double lastAvailableConfirmedPer100kInhabitants;
  String lastAvailableDate;
  double lastAvailableDeathRate;
  int lastAvailableDeaths;
  int newConfirmed;
  int newDeaths;
  int orderForPlace;
  String placeType;
  String state;

  CovidModel(
      {this.city,
      this.cityIbgeCode,
      this.date,
      this.epidemiologicalWeek,
      this.estimatedPopulation,
      this.estimatedPopulation2019,
      this.isLast,
      this.isRepeated,
      this.lastAvailableConfirmed,
      this.lastAvailableConfirmedPer100kInhabitants,
      this.lastAvailableDate,
      this.lastAvailableDeathRate,
      this.lastAvailableDeaths,
      this.newConfirmed,
      this.newDeaths,
      this.orderForPlace,
      this.placeType,
      this.state});

  CovidModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityIbgeCode = json['city_ibge_code'];
    date = json['date'];
    epidemiologicalWeek = json['epidemiological_week'];
    estimatedPopulation = json['estimated_population'];
    estimatedPopulation2019 = json['estimated_population_2019'];
    isLast = json['is_last'];
    isRepeated = json['is_repeated'];
    lastAvailableConfirmed = json['last_available_confirmed'];
    lastAvailableConfirmedPer100kInhabitants =
        json['last_available_confirmed_per_100k_inhabitants'];
    lastAvailableDate = json['last_available_date'];
    lastAvailableDeathRate = json['last_available_death_rate'];
    lastAvailableDeaths = json['last_available_deaths'];
    newConfirmed = json['new_confirmed'];
    newDeaths = json['new_deaths'];
    orderForPlace = json['order_for_place'];
    placeType = json['place_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['city_ibge_code'] = this.cityIbgeCode;
    data['date'] = this.date;
    data['epidemiological_week'] = this.epidemiologicalWeek;
    data['estimated_population'] = this.estimatedPopulation;
    data['estimated_population_2019'] = this.estimatedPopulation2019;
    data['is_last'] = this.isLast;
    data['is_repeated'] = this.isRepeated;
    data['last_available_confirmed'] = this.lastAvailableConfirmed;
    data['last_available_confirmed_per_100k_inhabitants'] =
        this.lastAvailableConfirmedPer100kInhabitants;
    data['last_available_date'] = this.lastAvailableDate;
    data['last_available_death_rate'] = this.lastAvailableDeathRate;
    data['last_available_deaths'] = this.lastAvailableDeaths;
    data['new_confirmed'] = this.newConfirmed;
    data['new_deaths'] = this.newDeaths;
    data['order_for_place'] = this.orderForPlace;
    data['place_type'] = this.placeType;
    data['state'] = this.state;
    return data;
  }
}

class DataModel {
  DataModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<ResultModel>? results;

  DataModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results =
        List.from(json['results']).map((e) => ResultModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ResultModel {
  ResultModel({
    this.city,
    this.cityIbgeCode,
    this.confirmed,
    this.confirmedPer_100kInhabitants,
    this.date,
    this.deathRate,
    this.deaths,
    this.estimatedPopulation,
    this.estimatedPopulation_2019,
    this.isLast,
    this.orderForPlace,
    this.placeType,
    this.state,
  });
  String? city;
  String? cityIbgeCode;
  int? confirmed;
  double? confirmedPer_100kInhabitants;
  String? date;
  double? deathRate;
  int? deaths;
  int? estimatedPopulation;
  int? estimatedPopulation_2019;
  bool? isLast;
  int? orderForPlace;
  String? placeType;
  String? state;

  ResultModel.fromJson(Map<String, dynamic> json) {
    city = null;
    cityIbgeCode = json['city_ibge_code'];
    confirmed = json['confirmed'];
    confirmedPer_100kInhabitants = json['confirmed_per_100k_inhabitants'];
    date = json['date'];
    deathRate = json['death_rate'];
    deaths = json['deaths'];
    estimatedPopulation = json['estimated_population'];
    estimatedPopulation_2019 = json['estimated_population_2019'];
    isLast = json['is_last'];
    orderForPlace = json['order_for_place'];
    placeType = json['place_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city;
    _data['city_ibge_code'] = cityIbgeCode;
    _data['confirmed'] = confirmed;
    _data['confirmed_per_100k_inhabitants'] = confirmedPer_100kInhabitants;
    _data['date'] = date;
    _data['death_rate'] = deathRate;
    _data['deaths'] = deaths;
    _data['estimated_population'] = estimatedPopulation;
    _data['estimated_population_2019'] = estimatedPopulation_2019;
    _data['is_last'] = isLast;
    _data['order_for_place'] = orderForPlace;
    _data['place_type'] = placeType;
    _data['state'] = state;
    return _data;
  }
}

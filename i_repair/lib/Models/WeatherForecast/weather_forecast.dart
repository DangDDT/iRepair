class WeatherForecast {
  String date;
  int temperatureC;
  int temperatureF;
  String summary;

  WeatherForecast(
      {required this.date,
      required this.temperatureC,
      required this.temperatureF,
      required this.summary});
  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: json['date'] as String,
      temperatureC: json['temperatureC'] as int,
      temperatureF: json['temperatureF'] as int,
      summary: json['summary'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['temperatureC'] = this.temperatureC;
    data['temperatureF'] = this.temperatureF;
    data['summary'] = this.summary;
    return data;
  }

  @override
  String toString() {
    return "{date: $date, temperatureC: $temperatureC , temperatureF: $temperatureF, summary: $summary}";
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:i_repair/Models/api.services.dart';
import 'package:i_repair/Models/WeatherForecast/weather_forecast.dart';

class WeatherForecastWidget extends StatefulWidget {
  WeatherForecastWidget({Key? key}) : super(key: key);
  @override
  _WeatherForecastWidgetState createState() => _WeatherForecastWidgetState();
}

class _WeatherForecastWidgetState extends State<WeatherForecastWidget> {
  List<WeatherForecast> weatherForecasts = <WeatherForecast>[];

  @override
  void initState() {
    super.initState();
    APIServices.fetchWeatherForecast().then((response) {
      Iterable list = json.decode(response.body);
      List<WeatherForecast> weatherForecastList;
      weatherForecastList =
          list.map((model) => WeatherForecast.fromJson(model)).toList();
      setState(() => {weatherForecasts = weatherForecastList});
    });
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("$weatherForecasts");
    return Scaffold(
      appBar: AppBar(
        title: Text("WeatherForecastWidgetList"),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: weatherForecasts.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    title: ListTile(
                      title: Text(weatherForecasts[index].toString()),
                    ),
                  ),
                );
              })),
    );
  }
}

import 'package:weather_flutter_app/models/weather.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  Weather weather;
  WeatherLoadedState({required this.weather});
}

class WeatherErrorState extends WeatherState {
  String errorMessage;
  WeatherErrorState({required this.errorMessage});
}

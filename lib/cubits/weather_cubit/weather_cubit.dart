import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_flutter_app/models/weather.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoadingState()) {
    getWeather();
  }
  final _dio = Dio();

  Future<void> getWeather() async {
    try {
      emit(WeatherLoadingState());
      final position = await _getCurrentPosition();
      if (position != null) {
        final weather = await _fetchWeather(position);
        emit(WeatherLoadedState(weather: weather));
      }
    } catch (e) {
      emit(WeatherErrorState(
        errorMessage: 'Произошла ошибка, повторите еще раз',
      ));
    }
  }

  Future<Position?> _getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      timeLimit: const Duration(seconds: 20),
    );
  }

  Future<Weather> _fetchWeather(Position position) async {
    const getWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
    var response = await _dio.get(
      getWeatherUrl,
      queryParameters: {
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': '18be0426cee1feabd45330eaddb3c3a0',
        'units': 'metric'
      },
    );
    final data = response.data;
    return Weather.fromJson(data);
  }
}

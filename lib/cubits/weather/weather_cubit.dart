import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_flutter_app/cubits/weather/weather_state.dart';
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
      final weather = await _getWeatherInMyCity(position);
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherErrorState(
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> searchData(String query, String locale) async {
    try {
      emit(WeatherLoadingState());
      const getWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
      var response = await _dio.get(
        getWeatherUrl,
        queryParameters: {
          'lang': locale,
          'q': query,
          'appid': '18be0426cee1feabd45330eaddb3c3a0',
          'units': 'metric'
        },
      );
      final json = response.data;
      final weather = Weather.fromJson(json);
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherErrorState(errorMessage: 'search_weather_error'));
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    const locationErrorMessage = 'get_weather_error';

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error(locationErrorMessage);
    }

    permission = await Geolocator.checkPermission();
    final isDeniedForever = permission == LocationPermission.deniedForever;
    if (isDeniedForever) {
      return Future.error(locationErrorMessage);
    }

    final isDenied = permission == LocationPermission.denied;
    if (isDenied) {
      permission = await Geolocator.requestPermission();
    }
    final isDeniedAgain = permission == LocationPermission.denied;
    if (isDeniedAgain) {
      return Future.error(locationErrorMessage);
    }

    return await Geolocator.getCurrentPosition(
        timeLimit: const Duration(seconds: 20));
  }

  Future<Weather> _getWeatherInMyCity(Position position) async {
    const getWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
    var response = await _dio.get(
      getWeatherUrl,
      queryParameters: {
        'lang': 'ru',
        'lat': position.latitude,
        'lon': position.longitude,
        'appid': '18be0426cee1feabd45330eaddb3c3a0',
        'units': 'metric'
      },
    );
    final json = response.data;
    return Weather.fromJson(json);
  }
}

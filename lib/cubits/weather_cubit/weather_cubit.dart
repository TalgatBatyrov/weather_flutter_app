import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_flutter_app/models/weather.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoadingState()) {
    getWeather();
  }
  final _dio = Dio();
  final controller = TextEditingController();

  Future<void> getWeather() async {
    try {
      emit(WeatherLoadingState());
      final position = await _getCurrentPosition();
      final weather = await _getWeatherInMyCity(position);
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherErrorState(
        errorMessage: tr('get_weather_error'),
      ));
    }
  }

  Future<void> searchData(String query) async {
    try {
      emit(WeatherLoadingState());
      const getWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
      var response = await _dio.get(
        getWeatherUrl,
        queryParameters: {
          'q': query,
          'appid': '18be0426cee1feabd45330eaddb3c3a0',
          'units': 'metric'
        },
      );
      final json = response.data;
      final weather = Weather.fromJson(json);
      emit(WeatherLoadedState(weather: weather));
    } catch (e) {
      emit(WeatherErrorState(errorMessage: tr('search_weather_error')));
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.whileInUse) {
        permission = await Geolocator.requestPermission();
      } else {
        return Future.error(
          'Чтобы определить погоду в Вашем городе включите геоданные и нажмите на кнопку (Погода в вашем городе)',
        );
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<Weather> _getWeatherInMyCity(Position position) async {
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
    final json = response.data;
    return Weather.fromJson(json);
  }
}

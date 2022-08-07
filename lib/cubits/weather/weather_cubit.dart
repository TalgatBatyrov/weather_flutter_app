import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather/weather_state.dart';
import 'package:weather_flutter_app/models/weather.dart';
import 'package:weather_flutter_app/services/weather_api.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoadingState());
  final _dio = Dio();

  Future<void> getWeather(String locale) async {
    try {
      emit(WeatherLoadingState());
      final position = await WeatherApi().getCurrentPosition();
      final weather = await WeatherApi().getWeatherInMyCity(position, locale);
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
}

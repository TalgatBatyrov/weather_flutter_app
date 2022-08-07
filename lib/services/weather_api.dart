import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_flutter_app/models/weather.dart';

class WeatherApi {
  final _dio = Dio();

  Future<Position> getCurrentPosition() async {
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

  Future<Weather> getWeatherInMyCity(Position position, String locale) async {
    try {
      const getWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';
      var response = await _dio.get(
        getWeatherUrl,
        queryParameters: {
          'lang': locale,
          'lat': position.latitude,
          'lon': position.longitude,
          'appid': '18be0426cee1feabd45330eaddb3c3a0',
          'units': 'metric'
        },
      );
      final json = response.data;
      return Weather.fromJson(json);
    } catch (e) {
      return Future.error('get_weather_error');
    }
  }
}

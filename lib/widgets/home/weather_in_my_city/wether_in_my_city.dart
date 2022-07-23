import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';

class WeatherInMyCity extends StatelessWidget {
  const WeatherInMyCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();
    return ElevatedButton(
      onPressed: weatherCubit.getWeather,
      child: Text(tr('weather_in_your_city')),
    );
  }
}

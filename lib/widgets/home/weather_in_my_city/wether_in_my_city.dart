import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather/weather_cubit.dart';

class WeatherInMyCity extends StatelessWidget {
  const WeatherInMyCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    final weatherCubit = context.read<WeatherCubit>();
    return GestureDetector(
      onTap: () => weatherCubit.getWeather(tr('locale')),
      child: const Icon(Icons.location_on),
    );
  }
}

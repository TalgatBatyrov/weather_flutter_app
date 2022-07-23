import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_flutter_app/widgets/app_bar_actions/app_bar_actions.dart';
import 'package:weather_flutter_app/widgets/home/search_weather/search_weather.dart';
import 'package:weather_flutter_app/widgets/home/weather_details/weather_details.dart';
import 'package:weather_flutter_app/widgets/home/weather_in_my_city/wether_in_my_city.dart';
import 'package:weather_flutter_app/widgets/home/weather_info/weather_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: const [AppBarActions()],
          title: Text(tr('weather_app_title')),
        ),
        body: Column(
          children: const [
            WeatherInMyCity(),
            SearchWeather(),
            WeatherInfo(),
            WeatherDetails(),
          ],
        ),
      ),
    );
  }
}

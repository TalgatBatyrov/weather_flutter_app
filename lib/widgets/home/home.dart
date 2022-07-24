import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather/weather_cubit.dart';
import 'package:weather_flutter_app/widgets/home/elements/app_bar_actions.dart';
import 'package:weather_flutter_app/widgets/home/elements/search_weather/search_weather.dart';
import 'package:weather_flutter_app/widgets/home/elements/weather_details/weather_details.dart';
import 'package:weather_flutter_app/widgets/home/elements/weather_info/weather_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    return BlocProvider(
      create: (_) => WeatherCubit()..getWeather(tr('locale')),
      child: Scaffold(
        appBar: AppBar(
          actions: const [AppBarActions()],
          title: Text(tr('weather_app_title')),
        ),
        body: Column(
          children: const [
            SearchWeather(),
            WeatherInfo(),
            SizedBox(height: 10),
            WeatherDetails(),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_flutter_app/widgets/home/weather_details/elements/weather_detail_items.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          final weather = state.weather;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  WeathetDetailItems(
                    icon: FontAwesomeIcons.thermometer,
                    color: Colors.blue,
                    description: '${weather.temperature}\u00B0',
                    title: tr('temperature'),
                  ),
                  WeathetDetailItems(
                    icon: FontAwesomeIcons.cloud,
                    color: const Color.fromARGB(255, 83, 142, 191),
                    description: weather.condition.toLowerCase(),
                    title: tr('cloud'),
                  ),
                  WeathetDetailItems(
                    icon: FontAwesomeIcons.sun,
                    color: const Color.fromARGB(255, 191, 177, 54),
                    description: weather.description,
                    title: tr('sun'),
                  ),
                  WeathetDetailItems(
                    icon: FontAwesomeIcons.wind,
                    color: const Color.fromARGB(255, 136, 136, 132),
                    description: '${weather.windSpeed.round()} m/s',
                    title: tr('wind_speed'),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

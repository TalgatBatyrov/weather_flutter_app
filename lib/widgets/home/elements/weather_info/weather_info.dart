import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/theme/theme_cubit.dart';
import 'package:weather_flutter_app/cubits/weather/weather_cubit.dart';
import 'package:weather_flutter_app/cubits/weather/weather_state.dart';
import 'package:weather_flutter_app/widgets/home/elements/weather_info/elements/weather_info_label.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is WeatherErrorState) {
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
              child: Text(
                tr(state.errorMessage),
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(176, 218, 19, 5),
                ),
              ),
            ),
          );
        }
        if (state is WeatherLoadedState) {
          final weather = state.weather;
          final themeCubit = context.watch<ThemeCubit>();
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: themeCubit.isLight
                  ? const Color.fromARGB(223, 53, 138, 196)
                  : const Color.fromARGB(255, 59, 60, 60),
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherInfoLabel(title: "${weather.name} ${weather.country}"),
                WeatherInfoLabel(title: '${weather.temperature}\u00B0'),
                WeatherInfoLabel(title: weather.description, fontSize: 20)
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

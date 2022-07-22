import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_flutter_app/widgets/home/weather_info/elements/weather_info_label.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return Container(
            color: const Color.fromARGB(255, 103, 170, 188),
            height: MediaQuery.of(context).size.height / 3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is WeatherErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          );
        }
        if (state is WeatherLoadedState) {
          final weather = state.weather;
          return Container(
            color: weather.temperature > 25
                ? const Color.fromARGB(255, 216, 202, 74)
                : const Color.fromARGB(255, 103, 170, 188),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherInfoLabel(title: weather.name),
                WeatherInfoLabel(title: '${weather.temperature}\u00B0'),
                WeatherInfoLabel(
                  title: weather.description,
                  fontSize: 20,
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

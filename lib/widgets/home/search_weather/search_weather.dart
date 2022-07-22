import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/theme/theme_cubit.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();
    final lightTheme = context.watch<ThemeCubit>().lightTheme;
    return TextField(
      controller: weatherCubit.controller,
      onEditingComplete: () {
        weatherCubit.searchData(
          weatherCubit.controller.text.toLowerCase(),
        );
      },
      style: TextStyle(
        color:
            lightTheme ? const Color.fromARGB(179, 56, 38, 38) : Colors.white,
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: tr('search_by_city_name'),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

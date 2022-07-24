import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/theme/theme_cubit.dart';
import 'package:weather_flutter_app/cubits/weather/weather_cubit.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    final weatherCubit = context.read<WeatherCubit>();
    final themeCubit = context.watch<ThemeCubit>();
    final inputController = TextEditingController();
    return Container(
      color: themeCubit.isLight
          ? const Color.fromARGB(223, 53, 138, 196)
          : const Color.fromARGB(255, 59, 60, 60),
      child: TextField(
        controller: inputController,
        onEditingComplete: () {
          weatherCubit.searchData(
            inputController.text.toLowerCase(),
            tr('locale'),
          );
          inputController.text = '';
        },
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontStyle: FontStyle.italic,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: tr('search_by_city_name'),
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

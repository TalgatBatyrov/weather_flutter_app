import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';

class SearchWeather extends StatelessWidget {
  const SearchWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final weatherCubit = context.read<WeatherCubit>();
    return TextField(
      controller: searchController,
      onEditingComplete: () {
        weatherCubit.searchData(searchController.text.toLowerCase());
      },
      style: const TextStyle(
        color: Color.fromARGB(179, 56, 38, 38),
        fontSize: 18,
        fontStyle: FontStyle.italic,
      ),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintTextDirection: TextDirection.ltr,
        hintText: 'Search by city name',
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

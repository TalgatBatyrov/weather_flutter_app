import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_flutter_app/widgets/home/weather_details/weather_details.dart';
import 'package:weather_flutter_app/widgets/home/weather_info/weather_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Weather app')),
        body: Column(
          children: const [
            WeatherInfo(),
            WeatherDetails(),
          ],
        ),
      ),
    );
  }
}

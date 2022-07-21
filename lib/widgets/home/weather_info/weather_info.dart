import 'package:flutter/material.dart';
import 'package:weather_flutter_app/widgets/home/weather_info/elements/weather_Info_label.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 103, 170, 188),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          WeatherInfoLabel(title: 'Bishkek'),
          WeatherInfoLabel(title: '40'),
          WeatherInfoLabel(title: 'Suny', fontSize: 20),
        ],
      ),
    );
  }
}

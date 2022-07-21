import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle topInfoStyle = const TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    return Container(
      color: const Color.fromARGB(255, 103, 170, 188),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('City name', style: topInfoStyle),
          Text('Temperature', style: topInfoStyle),
          Text('Currently', style: topInfoStyle),
        ],
      ),
    );
  }
}

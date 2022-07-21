import 'package:flutter/material.dart';

class WeatherInfoLabel extends StatelessWidget {
  final String title;
  final double fontSize;
  const WeatherInfoLabel({
    Key? key,
    required this.title,
    this.fontSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

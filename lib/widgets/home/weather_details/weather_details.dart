import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_flutter_app/widgets/home/weather_details/elements/weather_detail_items.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
            _DetailsItem(),
            WeathetDetailItems(
              color: Color.fromARGB(255, 126, 153, 175),
              description: '${0}',
              title: 'Temperature',
            ),
            WeathetDetailItems(
              color: Color.fromARGB(255, 191, 177, 54),
              description: '${0}',
              title: 'Humidity',
            ),
            WeathetDetailItems(
              color: Colors.grey,
              description: '${0} m/s',
              title: 'Wind Speed',
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: FaIcon(FontAwesomeIcons.thermometer, color: Colors.blue),
      title: Text('Temperature'),
      trailing: Text(' ${0}\u00B0'),
    );
  }
}

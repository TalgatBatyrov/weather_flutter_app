import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cloud,
                  color: Color.fromARGB(255, 126, 153, 175)),
              title: Text('Weather'),
              trailing: Text('Description'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.sun,
                  color: Color.fromARGB(255, 191, 177, 54)),
              title: Text('Humidity'),
              trailing: Text('${0}%'),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.wind, color: Colors.grey),
              title: Text('Wind Speed'),
              trailing: Text('${0} m/s'),
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

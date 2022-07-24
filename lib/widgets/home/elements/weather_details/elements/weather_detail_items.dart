import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeathetDetailItems extends StatelessWidget {
  final Color color;
  final String title;
  final String description;
  final IconData icon;
  const WeathetDetailItems({
    Key? key,
    required this.color,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle style =
        TextStyle(fontSize: 18, fontStyle: FontStyle.italic);

    return ListTile(
        leading: FaIcon(icon, color: color),
        title: Text(
          title,
          style: style,
        ),
        trailing: Text(
          description,
          style: style,
        ));
  }
}

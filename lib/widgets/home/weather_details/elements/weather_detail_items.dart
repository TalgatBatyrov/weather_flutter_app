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
    return ListTile(
      leading: FaIcon(icon, color: color),
      title: Text(title),
      trailing: Text(
        description,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

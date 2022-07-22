import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/theme/theme_cubit.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final lightTheme = themeCubit.lightTheme;
    return Row(
      children: [
        Text(
          tr('light_theme'),
          style: const TextStyle(
            color: Color.fromARGB(255, 230, 206, 206),
            fontFamily: 'SF Pro Text',
          ),
        ),
        const SizedBox(width: 10),
        Switch(
          activeColor: Colors.blue[200],
          value: lightTheme,
          onChanged: (_) => themeCubit.themeChanged(),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/cubits/theme/theme_cubit.dart';
import 'package:weather_flutter_app/widgets/home/weather_in_my_city/wether_in_my_city.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();

    void locale(String languageSubtype, String countrySubtype) {
      context.setLocale(Locale(languageSubtype, countrySubtype));
      Navigator.of(context).pop();
    }

    return Row(
      children: [
        const WeatherInMyCity(),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(
                      onPressed: () => locale('ru', 'RU'),
                      child: const Text(
                        'Русский',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => locale('ky', 'KG'),
                      child: const Text('Кыргызча'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => locale('en', 'US'),
                      child: const Text('English'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.language),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: themeCubit.toggle,
          icon: Icon(
            themeCubit.isLight ? Icons.light_mode : Icons.dark_mode,
          ),
        )
      ],
    );
  }
}

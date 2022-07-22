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
    void locale(String languageSubtype, String countrySubtype) {
      context.setLocale(Locale(languageSubtype, countrySubtype));
      Navigator.of(context).pop();
    }

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) {
                ButtonStyle buttonStyle = ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 41, 164, 172)),
                );
                return AlertDialog(
                  backgroundColor: const Color.fromARGB(177, 48, 46, 46),
                  actionsAlignment: MainAxisAlignment.end,
                  actions: [
                    TextButton(
                      style: buttonStyle,
                      onPressed: () => locale('ru', 'RU'),
                      child: const Text(
                        'Русский',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      style: buttonStyle,
                      onPressed: () => locale('ky', 'KG'),
                      child: const Text('Кыргызча'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      style: buttonStyle,
                      onPressed: () => locale('en', 'US'),
                      child: const Text('English'),
                    ),
                  ],
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.language,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
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

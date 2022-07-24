import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:weather_flutter_app/cubits/theme/theme_state.dart';

// class ThemeCubit extends Cubit<ThemeState> {
//   bool lightTheme = true;
//   ThemeCubit() : super(ThemeisChanged(themeMode: true)) {
//     loadTheme();
//   }

//   void themeChanged() async {
//     final prefs = await SharedPreferences.getInstance();
//     lightTheme = !lightTheme;
//     await prefs.setBool('theme', lightTheme);
//     emit(ThemeisChanged(themeMode: lightTheme));
//   }

//   void loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     lightTheme = prefs.getBool('theme') ?? lightTheme;
//     emit(ThemeisChanged(themeMode: lightTheme));
//   }
// }

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  bool get isLight => state.brightness == Brightness.light;

  void toggle() {
    if (isLight) {
      emit(
        ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Text'),
            headline6: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                fontFamily: 'SF Pro Text'),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'SF Pro Text'),
          ),
        ),
      );
    } else {
      emit(
        ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[800],
          primarySwatch: Colors.blueGrey,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro Text'),
            headline6: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                fontFamily: 'SF Pro Text'),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'SF Pro Text'),
          ),
        ),
      );
    }
  }
}

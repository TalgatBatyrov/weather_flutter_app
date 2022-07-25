import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_flutter_app/resources/theme_modes.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeModes().darkMode);

  bool get isLight => state.brightness == Brightness.light;

  void toggle() {
    if (isLight) {
      emit(ThemeModes().darkMode);
    } else {
      emit(ThemeModes().lightMode);
    }
  }
}

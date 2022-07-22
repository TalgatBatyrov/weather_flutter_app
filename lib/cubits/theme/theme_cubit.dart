import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_flutter_app/cubits/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool lightTheme = true;
  ThemeCubit() : super(ThemeisChanged(themeMode: true)) {
    loadTheme();
  }

  void themeChanged() async {
    final prefs = await SharedPreferences.getInstance();
    lightTheme = !lightTheme;
    await prefs.setBool('theme', lightTheme);
    emit(ThemeisChanged(themeMode: lightTheme));
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    lightTheme = prefs.getBool('theme') ?? lightTheme;
    emit(ThemeisChanged(themeMode: lightTheme));
  }
}

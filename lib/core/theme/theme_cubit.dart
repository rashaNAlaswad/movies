import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/shared_pref_keys.dart';
import '../helper/shared_preferences_helper.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(isDarkMode: false)) {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    try {
      final isDarkMode =
          CacheHelper.getBool(key: SharedPrefKeys.isDarkMode) ?? false;
      emit(ThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      // If error loading preference, default to light mode
      emit(const ThemeState(isDarkMode: false));
    }
  }

  Future<void> toggleTheme() async {
    try {
      final newIsDarkMode = !state.isDarkMode;
      await CacheHelper.set(
        key: SharedPrefKeys.isDarkMode,
        value: newIsDarkMode,
      );
      emit(ThemeState(isDarkMode: newIsDarkMode));
    } catch (e) {
      // If error saving preference, still update state
      emit(ThemeState(isDarkMode: !state.isDarkMode));
    }
  }
}

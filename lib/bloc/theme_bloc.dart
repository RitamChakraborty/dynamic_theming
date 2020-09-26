import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void changeTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    switch (json['themeMode']) {
      case "system":
        return ThemeMode.system;
      case "light":
        return ThemeMode.light;
      case "dark":
        return ThemeMode.dark;
    }

    return null;
  }

  @override
  Map<String, dynamic> toJson(ThemeMode themeMode) {
    String themeModeStr;
    switch (themeMode) {
      case ThemeMode.system:
        themeModeStr = "system";
        break;
      case ThemeMode.light:
        themeModeStr = "light";
        break;
      case ThemeMode.dark:
        themeModeStr = "dark";
        break;
    }

    return {'themeMode': themeModeStr};
  }
}

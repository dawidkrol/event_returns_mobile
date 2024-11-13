part of 'theme_switcher_cubit.dart';

@freezed
class ThemeSwitcherState with _$ThemeSwitcherState {
  const factory ThemeSwitcherState.lightMode() = _LightMode;
  const factory ThemeSwitcherState.darkMode() = _DarkMode;
}

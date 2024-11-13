import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_switcher_state.dart';

part 'theme_switcher_cubit.freezed.dart';

class ThemeSwitcherCubit extends Cubit<ThemeSwitcherState> {
  ThemeSwitcherCubit() : super(const ThemeSwitcherState.lightMode());

  void toggleTheme() {
    emit(
      state.when(
        lightMode: () => const ThemeSwitcherState.darkMode(),
        darkMode: () => const ThemeSwitcherState.lightMode(),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarCubit extends Cubit<bool> {
  SearchBarCubit() : super(false); // Domyślnie ustawione jako zwinięte

  void toggle() => emit(!state); // Przełącza stan rozszerzenia
}

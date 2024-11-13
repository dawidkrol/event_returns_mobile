import 'package:bloc/bloc.dart';

class MainScreenSwitcherViewCubit extends Cubit<int> {
  MainScreenSwitcherViewCubit() : super(1);

  void switchView(int index) => emit(index);
}

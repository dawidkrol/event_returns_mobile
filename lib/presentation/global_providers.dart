import 'package:event_returns_mobile/features/map/presentation/cubit/map_cubit.dart';
import 'package:event_returns_mobile/features/theme_switcher/cubit/theme_switcher_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeSwitcherCubit()),
        BlocProvider(create: (context) => MapCubit()),
      ],
      child: child,
    );
  }
}

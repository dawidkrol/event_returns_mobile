import 'package:auto_route/annotations.dart';
import 'package:event_returns_mobile/core/theme/theme_helpers.dart';
import 'package:event_returns_mobile/features/map/presentation/map.dart';
import 'package:event_returns_mobile/presentation/screens/main_screen/cubit/main_screen_switcher_view_cubit.dart';
import 'package:event_returns_mobile/presentation/screens/main_screen/views/profile_view.dart';
import 'package:event_returns_mobile/presentation/screens/main_screen/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainScreenSwitcherViewCubit(),
      child: Scaffold(
        backgroundColor: context.colorPalette.background,
        body: BlocBuilder<MainScreenSwitcherViewCubit, int>(
          builder: (context, viewIndex) {
            return _buildView(viewIndex);
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              backgroundColor: context.colorPalette.background,
              currentIndex: context.watch<MainScreenSwitcherViewCubit>().state,
              onTap: (index) => context.read<MainScreenSwitcherViewCubit>().switchView(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildView(int index) {
    switch (index) {
      case 0:
        return ProfileView();
      case 1:
        return MapWidget();
      case 2:
        return SettingsView();
      default:
        return MapWidget();
    }
  }
}

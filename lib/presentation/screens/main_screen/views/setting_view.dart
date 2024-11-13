import 'package:event_returns_mobile/core/theme/theme_helpers.dart';
import 'package:event_returns_mobile/features/theme_switcher/cubit/theme_switcher_cubit.dart';
import 'package:event_returns_mobile/presentation/common/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.colorPalette.background,
          surfaceTintColor: Colors.red,
          pinned: true,
          actions: [
            UiButton.icon(
              onPressed: () => context.read<ThemeSwitcherCubit>().toggleTheme(),
              icon: const Icon(Icons.light_mode_rounded),
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
              height: 800,
              child: Center(
                child: Text('Settings View'),
              )
              // child: CandlestickChartPage(),
              ),
        ),
      ],
    );
  }
}

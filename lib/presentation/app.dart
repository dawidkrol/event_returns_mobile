import 'package:auto_route/auto_route.dart';
import 'package:event_returns_mobile/core/theme/app_typography.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/theme_helpers.dart';
import 'package:event_returns_mobile/features/theme_switcher/theme_switcher.dart';
import 'package:event_returns_mobile/l10n/l10n.dart';
import 'package:event_returns_mobile/presentation/global_providers.dart';
import 'package:event_returns_mobile/presentation/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRoute = AppRouter();

  final lightTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.lightPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.light,
  );

  final darkTheme = ThemeDataExtensions.createThemeData(
    palette: ColorPalette.darkPalette,
    typography: AppTypography.defaultTypography,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: BlocBuilder<ThemeSwitcherCubit, ThemeSwitcherState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.map(
              lightMode: (_) => lightTheme,
              darkMode: (_) => darkTheme,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _appRoute.config(
              deepLinkBuilder: (deepLink) {
                if (kIsWeb) {
                  return deepLink;
                }

                if (deepLink.uri.fragment == '/' ||
                    deepLink.uri.fragment.isEmpty) {
                  return DeepLink.defaultPath;
                }

                return DeepLink.path(deepLink.uri.fragment);
              },
            ),
          );
        },
      ),
    );
  }
}

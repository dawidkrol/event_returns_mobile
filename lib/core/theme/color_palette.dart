import 'package:flutter/material.dart';

/// An extension for theme to provide a color palette in context.
class ColorPalette extends ThemeExtension<ColorPalette> {
  const ColorPalette({
    required this.background,
    required this.foreground,
    required this.muted,
    required this.mutedForeground,
    required this.border,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.ring,
  });

  /// Default background color
  final Color background;

  /// Default foreground color
  final Color foreground;

  /// Muted backgrounds
  final Color muted;

  /// Color for text on muted backgrounds
  final Color mutedForeground;

  /// Default border color
  final Color border;

  /// Primary colors
  final Color primary;

  /// Color for text on primary colors
  final Color primaryForeground;

  /// Secondary colors
  final Color secondary;

  /// Color for text on secondary colors
  final Color secondaryForeground;

  /// Used for accents such as hover effects
  final Color accent;

  /// Used for accents such as hover effects
  final Color accentForeground;

  /// Used for destructive actions
  final Color destructive;

  /// Color for text on destructive actions
  final Color destructiveForeground;

  /// The ring color of the app, used for focus rings.
  final Color ring;

  @override
  ThemeExtension<ColorPalette> copyWith({
    Color? background,
    Color? foreground,
    Color? muted,
    Color? mutedForeground,
    Color? border,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? ring,
  }) =>
      ColorPalette(
        background: background ?? this.background,
        foreground: foreground ?? this.foreground,
        muted: muted ?? this.muted,
        mutedForeground: mutedForeground ?? this.mutedForeground,
        border: border ?? this.border,
        primary: primary ?? this.primary,
        primaryForeground: primaryForeground ?? this.primaryForeground,
        secondary: secondary ?? this.secondary,
        secondaryForeground: secondaryForeground ?? this.secondaryForeground,
        accent: accent ?? this.accent,
        accentForeground: accentForeground ?? this.accentForeground,
        destructive: destructive ?? this.destructive,
        destructiveForeground:
            destructiveForeground ?? this.destructiveForeground,
        ring: ring ?? this.ring,
      );

  @override
  ThemeExtension<ColorPalette> lerp(
    covariant ThemeExtension<ColorPalette>? other,
    double t,
  ) {
    if (other == null || other is! ColorPalette) {
      return this;
    }

    return ColorPalette(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t)!,
      border: Color.lerp(border, other.border, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      primaryForeground:
          Color.lerp(primaryForeground, other.primaryForeground, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryForeground:
          Color.lerp(secondaryForeground, other.secondaryForeground, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentForeground:
          Color.lerp(accentForeground, other.accentForeground, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      destructiveForeground:
          Color.lerp(destructiveForeground, other.destructiveForeground, t)!,
      ring: Color.lerp(ring, other.ring, t)!,
    );
  }

  Map<String, Color> toMap() => {
        'Background': background,
        'Foreground': foreground,
        'Muted': muted,
        'Muted Foreground': mutedForeground,
        'Border': border,
        'Primary': primary,
        'Primary Foreground': primaryForeground,
        'Secondary': secondary,
        'Secondary Foreground': secondaryForeground,
        'Accent': accent,
        'Accent Foreground': accentForeground,
        'Destructive': destructive,
        'Destructive Foreground': destructiveForeground,
        'Ring': ring,
      };

  static const lightPalette = ColorPalette(
    background: Color(0xFFFFFFFF),
    foreground: Color(0xFF000000),
    muted: Color(0xFFF5F5F5),
    mutedForeground: Color(0xFF000000),
    border: Color(0xFFE0E0E0),
    primary: Color(0xFF6200EE),
    primaryForeground: Color(0xFFFFFFFF),
    secondary: Color(0xFF03DAC6),
    secondaryForeground: Color(0xFF000000),
    accent: Color(0xFF018786),
    accentForeground: Color(0xFFFFFFFF),
    destructive: Color(0xFFB00020),
    destructiveForeground: Color(0xFFFFFFFF),
    ring: Color(0xFF0000FF),
  );

  static const darkPalette = ColorPalette(
    background: Color(0xFF121212),
    foreground: Color(0xFFFFFFFF),
    muted: Color(0xFF1E1E1E),
    mutedForeground: Color(0xFFFFFFFF),
    border: Color(0xFF303030),
    primary: Color(0xFFBB86FC),
    primaryForeground: Color(0xFF000000),
    secondary: Color(0xFF03DAC6),
    secondaryForeground: Color(0xFF000000),
    accent: Color(0xFF03DAC6),
    accentForeground: Color(0xFF000000),
    destructive: Color(0xFFCF6679),
    destructiveForeground: Color(0xFF000000),
    ring: Color(0xFF0000FF),
  );

  ColorScheme get colorScheme => ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: background,
        error: destructive,
        onPrimary: primaryForeground,
        onSecondary: secondaryForeground,
        onSurface: foreground,
        onError: destructiveForeground,
      );
}

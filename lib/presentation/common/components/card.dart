import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/color_palette.dart';
import 'package:event_returns_mobile/core/theme/theme_helpers.dart';

/// Card widget from the UIKit package.
class UiCard extends StatelessWidget {
  const UiCard({
    required this.child,
    this.semanticContainer = true,
    this.color,
    this.margin,
    super.key,
  });

  /// The color to paint the card.
  ///
  /// If null, defaults to [ColorPalette.surface]
  final Color? color;

  /// The empty space that surrounds the card.
  ///
  /// Defines the card's outer [Padding].
  ///
  /// If this property is null then 4.0 logical pixels of padding is added to
  /// all sides.
  final EdgeInsetsGeometry? margin;

  /// Whether this widget represents a single semantic container, or if false
  /// a collection of individual semantic nodes.
  ///
  /// Defaults to true.
  ///
  /// Setting this flag to true will attempt to merge all child semantics into
  /// this node. Setting this flag to false will force all child semantic nodes
  /// to be explicit.
  ///
  /// This flag should be false if the card contains multiple different types
  /// of content.
  final bool semanticContainer;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(4),
      child: Material(
        type: MaterialType.card,
        elevation: 1,
        color: color ?? context.colorPalette.background,
        shadowColor: context.colorPalette.foreground.withOpacity(.20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}

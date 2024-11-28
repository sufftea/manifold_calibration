import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'presentation/routing/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        // betsRepositoryProvider.overrideWithValue(BetsRepositoryMock()),
      ],
      child: MaterialApp.router(
        theme: createTheme(),
        routerConfig: router,
      ),
    );
  }

  ThemeData createTheme() {
    final theme = FlexThemeData.light(
      scheme: FlexScheme.wasabi,
    );

    final colors = theme.colorScheme;
    return theme.copyWith(
        segmentedButtonTheme: SegmentedButtonThemeData(
            style: ButtonStyle(
      side: WidgetStatePropertyAll(
        BorderSide(color: colors.primary, width: 2),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return colors.onPrimary;
          } else {
            return colors.onSurface;
          }
        },
      ),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return colors.primary;
          } else {
            return Colors.transparent;
          }
        },
      ),
      textStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            );
          } else {
            return GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );
          }
        },
      ),
    )));
  }
}

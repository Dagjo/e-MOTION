/**
 * Creating custom color palettes is part of creating a custom app. The idea is to create
 * your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
 * object with those colors you just defined.
 *
 * Resource:
 * A good resource would be this website: http://mcg.mbitson.com/
 * You simply need to put in the colour you wish to use, and it will generate all shades
 * for you. Your primary colour will be the `500` value.
 *
 * Colour Creation:
 * In order to create the custom colours you need to create a `Map<int, Color>` object
 * which will have all the shade values. `const Color(0xFF...)` will be how you create
 * the colours. The six character hex code is what follows. If you wanted the colour
 * #114488 or #D39090 as primary colours in your theme, then you would have
 * `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
 *
 * Usage:
 * In order to use this newly created theme or even the colours in it, you would just
 * `import` this file in your project, anywhere you needed it.
 * `import 'path/to/theme.dart';`
 */

import 'package:flutter/material.dart';

final ThemeData feelThemeData = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: new MaterialColor(0xFFF9ADA0, FeelColors.peach),
    primaryColor: FeelColors.peach[500],
    primaryColorBrightness: Brightness.light,
    accentColor: FeelColors.blue[500],
    accentColorBrightness: Brightness.light,
    scaffoldBackgroundColor: FeelColors.blue[500],
);

class FeelColors {
  FeelColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> blue = const <int, Color> {
    50: const Color(0xFFEEF8FA),
    100: const Color(0xFFD4EDF4),
    200: const Color(0xFFB7E2EC),
    300: const Color(0xFF9AD6E4),
    400: const Color(0xFF84CDDF),
    500: const Color(0xFF6EC4D9),
    600: const Color(0xFF66BED5),
    700: const Color(0xFF5BB6CF),
    800: const Color(0xFF51AFCA),
    900: const Color(0xFF3FA2C0)
  };

  static const Map<int, Color> peach = const <int, Color> {
    50: const Color(0xFFFEF5F4),
    100: const Color(0xFFFDE6E3),
    200: const Color(0xFFFCD6D0),
    300: const Color(0xFFFBC6BD),
    400: const Color(0xFFFAB9AE),
    500: const Color(0xFFF9ADA0),
    600: const Color(0xFFF8A698),
    700: const Color(0xFFF79C8E),
    800: const Color(0xFFF69384),
    900: const Color(0xFFF58373)
  };
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  primaryColor: Palette.primary,
  useMaterial3: false,
  textTheme: GoogleFonts.interTightTextTheme(),
  fontFamily: 'Inter',
  checkboxTheme: CheckboxThemeData(
    side: MaterialStateBorderSide.resolveWith((states) {
      if (!states.contains(MaterialState.selected)) {
        return const BorderSide(
            width: 1, color: Color.fromRGBO(208, 213, 221, 1));
      }
      return const BorderSide(width: 1, color: Color.fromRGBO(76, 113, 169, 1));
    }),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
        (_) => const Color.fromRGBO(76, 113, 169, 1)),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (!states.contains(MaterialState.selected)) {
        return const Color.fromRGBO(255, 255, 255, 1);
      }
      return const Color.fromRGBO(210, 219, 233, 1);
    }),
  ),
);

class Palette {
  static Color primary = const Color(0xff0B142F);
  static Color secondary = const Color(0xffEC663A);

  static Color primaryDisabled = const Color(0xffB4BFCD);
  static Color primaryHover = const Color(0xff36537A);
  static Color primaryFocused = const Color(0xff042859);
  static Color blue = const Color(0xFF005AA7);
  static Color disabledButton = const Color.fromRGBO(165, 184, 212, 1);

  static Color secondaryDisabled = const Color(0xffFDF0EB);
  static Color secondaryHover = const Color(0xffF08561);
  static Color secondaryFocused = const Color(0xffEC663A);

  static Color secondaryOutlineDisabled = const Color(0xffF9D1C4);
  static Color secondaryOutlineHover = const Color(0xffFEF7F5);

  static Color secondaryTextDisabled = const Color(0xffF29475);
  static Color secondaryTextOutline = const Color(0xffEC663A);
  static Color secondaryTextOutlineDisabled = const Color(0xffF9D1C4);
  static Color shadowColor = Colors.grey.withOpacity(0.2);
  static Color success = const Color(0xff039855);
  static Color successLight = const Color(0xFFD1FADF);
  static Color text = const Color(0xFF343434);
  static Color hint = const Color(0xFF667085);
}

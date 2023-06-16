import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFF00C691),
  Colors.teal,
  Colors.blue,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppColors {
  static const darkPrimaryColor = Color(0xFF512DA8);
  static const lightPrimaryColor = Color(0xFFD1C4E9);
  static const primaryColor = Color(0xFF673AB7);
  static const primaryTextColor = Color(0xFF212121);
  static const secondaryTextColor = Color(0xFF757575);
  static const dividerColor = Color(0xFFBDBDBD);
  static const accentColor = Color(0xFF7C4DFF);
  static const textIconsColor = Color(0xFFFFFFFF);
}

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = true, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Campton',
            fontSize: 40,
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}

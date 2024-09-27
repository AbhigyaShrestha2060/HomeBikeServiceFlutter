import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();


  static ThemeData getApplicationTheme(bool isDark) {
    final baseTheme = isDark ? ThemeData.dark() : ThemeData.light();

    return baseTheme.copyWith(
      primaryColor: Colors.purple,
      colorScheme: baseTheme.colorScheme.copyWith(
        primary: isDark ? Colors.blueGrey[900]! : Colors.blue[800]!,
      ),
      brightness: isDark ? Brightness.dark : Brightness.light,

      // AppBar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: isDark ? Colors.blueGrey[800] : Colors.blue[700],
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.white,
          fontSize: 20,
        ),
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: isDark ? Colors.blueGrey[800] : Colors.blue[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),

      // IconButton theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: isDark ? Colors.white : Colors.blue[800],
        ),
      ),


      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDark ? Colors.blueGrey[700]! : Colors.blue[300]!,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        labelStyle:  const TextStyle(
          color:Colors.black,
        ),
        prefixIconColor: isDark ? Colors.blueGrey[100]! : Colors.blue[800]!,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDark ? Colors.blueGrey[800]! : Colors.blue[800]!,
          ),
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: isDark ? Colors.blueGrey[800]! : Colors.blue[800]!,
      ),

      // Card theme
      cardTheme: CardTheme(
        elevation: 4,
        color: isDark ? Colors.blueGrey[800]! : Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),

      // Text theme
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: isDark ? Colors.white70 : Colors.black87,
        ),
        bodyMedium: TextStyle(
          color: isDark ? Colors.white54 : Colors.black54,
        ),
        displayLarge: TextStyle(
          color: isDark ? Colors.white : Colors.blue[800],
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: isDark ? Colors.white : Colors.blue[700],
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: isDark ? Colors.white70 : Colors.blue[800],
        ),
        titleSmall: TextStyle(
          color: isDark ? Colors.white60 : Colors.blue[700],
        ),
      ),
    );
  }
}

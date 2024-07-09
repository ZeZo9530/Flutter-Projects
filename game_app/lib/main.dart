import 'package:flutter/material.dart';
import 'package:game_app/screens/random_noun.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 59, 181, 142),
);
var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 4, 123, 32),
);
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkScheme.primaryContainer,
              foregroundColor: kDarkScheme.onPrimaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
            elevation: 1,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          )),
      home: const RandomNoun(),
      themeMode: ThemeMode.system,
    ),
  );
}

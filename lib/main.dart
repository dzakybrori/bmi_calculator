import 'package:flutter/material.dart';

import './wrapper.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B1033),
        focusColor: Colors.white.withOpacity(0.15),
        disabledColor: Colors.white.withOpacity(0.08),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: const Color(0xFF0A0E21),
              primaryVariant: const Color(0xFF0A0E21),
              secondary: const Color(0xFFFF0067),
              background: Colors.white.withOpacity(0.08),
              // for Surface Active
              surface: const Color(0xFF0B1033), // AppBarColor
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF0067),
                textStyle: const TextStyle(fontSize: 16, letterSpacing: 1))),
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline6: ThemeData.dark()
                  .textTheme
                  .headline6
                  ?.copyWith(letterSpacing: 0.4),
              button:
                  ThemeData.dark().textTheme.button?.copyWith(letterSpacing: 1),
            ),
      ),
      home: const InputPage(),
    );
  }
}

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
              secondary: const Color(0xFFFF0067),
              // for Surface
              background: Colors.white.withOpacity(0.08),
              // AppBarColor
              surface: const Color(0xFF0B1033),
              onSurface: Colors.white54,
            ),
        sliderTheme: ThemeData.dark().sliderTheme.copyWith(
              thumbColor: const Color(0xFFFF0067),
              valueIndicatorColor: Colors.white,
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white30,
              trackHeight: 1.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayColor: const Color(0xFFFF0067).withOpacity(0.3),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 18.0),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF0067),
                textStyle: const TextStyle(fontSize: 16, letterSpacing: 1))),
        textTheme: ThemeData.dark().textTheme.copyWith(
              headline2: ThemeData.dark().textTheme.headline2?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white.withOpacity(0.9)),
              headline6: ThemeData.dark()
                  .textTheme
                  .headline6
                  ?.copyWith(letterSpacing: 0.5),
              subtitle1: const TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
              button:
                  ThemeData.dark().textTheme.button?.copyWith(letterSpacing: 1),
            ),
      ),
      home: const InputPage(),
    );
  }
}

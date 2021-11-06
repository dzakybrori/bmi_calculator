import 'package:flutter/material.dart';

import './input_page.dart';

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
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: const Color(0xFF0A0E21),
              primaryVariant: const Color(0xFF0A0E21),
              background: const Color(0xFF1D1E33), // for Surface Container
              surface: const Color(0xFF0A0E21), // AppBarColor
            ),
      ),
      home: const InputPage(),
    );
  }
}

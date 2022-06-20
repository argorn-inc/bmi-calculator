import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColorDark: const Color(0xff090c22),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff090c22),
        ),
        scaffoldBackgroundColor: const Color(0xff090c22),
      ),
      home: const InputPage(),
    );
  }
}

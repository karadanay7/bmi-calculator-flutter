import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight}) : _bmi = 0; // Initialize _bmi here
  final double height;
  final double weight;
 late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    } else {
      return "You have a lower than normal body weight. Focus on your eating habits.";
    }
  }
}

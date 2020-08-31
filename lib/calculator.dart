import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double _bmi;

  Calculator({this.height, this.weight});

  String calculateBMI() {
    this._bmi = weight / pow((height / 100), 2);
    return this._bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(this._bmi >= 25) {
      return "OVERWEIGHT";
    } else if (this._bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation() {
    if(this._bmi >= 25) {
      return "You have a higher than normal body weight. Try to excercise more my friend.";
    } else if (this._bmi > 18.5) {
      return "You have a normal body weight. Good job - Keep on doing!";
    } else {
      return "You have a lower than normal body weight. You are free to eat more!";
    }
  }
}
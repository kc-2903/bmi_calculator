import 'dart:math';
class Calc{
  final height;
  final weight;
  double _bmi;
  Calc({this.height,this.weight});
  
  String cb(){
    _bmi=weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String res(){
    if (_bmi>=25)
      return 'Overweight,Exercise more,burn fat!';
    else if (_bmi>18.5)
      return 'Normal,Good job!';
    else
      return 'Underweight,Eat more!';
  }
}
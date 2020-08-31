import 'package:bmi_calculator/inputPage.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String bmiInterpretation;

  ResultPage({@required this.bmiResult, @required this.resultText, @required this.bmiInterpretation});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "Your Result",
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText, style: TextStyle(color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold,)),
                  Text(bmiResult, style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 90.0, fontWeight: FontWeight.bold,)),
                  Padding(padding: EdgeInsets.all(10.0),
                  child: Text(bmiInterpretation, textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 22.0,)))
                ]
              ),
            )
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return InputPage();
                })
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: kBottomContainerHeight,
              color: bottomContainerColor,
              child: Center(
                child: Text("RE-CALCULATE", style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),),
              )
            ),
          )
        ],
      )
    );
  }
}
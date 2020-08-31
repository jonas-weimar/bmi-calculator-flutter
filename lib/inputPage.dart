import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator.dart';
import 'reusableCard.dart';
import 'resultPage.dart';
import 'constants.dart';

// Gender enum
enum Gender {
  MALE,
  FEMALE
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int userSelectedAge = 20;
  int userSelectedWeight = 70;
  int userSelectedHeight = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                  onTap: () => setState((){ selectedGender = Gender.MALE; }),
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0
                          ),
                          SizedBox(height: 15.0,),
                          Text("MALE", style: labelTextStyle,)
                        ]
                      ),
                      color: (selectedGender == Gender.FEMALE) ? inactiveCardColor : activeCardColor
                    ),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState((){ selectedGender = Gender.FEMALE; }),
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80.0
                          ),
                          SizedBox(height: 15.0,),
                          Text("FEMALE", style: labelTextStyle,)
                        ]
                      ),
                      color: (selectedGender == Gender.MALE) ? inactiveCardColor : activeCardColor
                    ),
                  )
                )
              ],
            )
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelTextStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        userSelectedHeight.toString(),
                        style: infoTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle
                      )
                    ],
                  ),
                  Slider(
                    min: 100.0,
                    max: 250.0,
                    value: userSelectedHeight.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        userSelectedHeight = newValue.round();
                      });
                    },
                  )
                ]
              ),
              color: Color(0xFF1d1E33),
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("WEIGHT", style: labelTextStyle,),
                        Text(userSelectedWeight.toString(), style: infoTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () => setState(() {
                                userSelectedWeight--;
                              }),
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                                size: 20.0
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              onPressed: () => setState(() {
                                userSelectedWeight++;
                              }),
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 20.0
                              ),
                            )
                          ],
                        )
                      ]
                    ),
                    color: Color(0xFF1d1E33),
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("AGE", style: labelTextStyle,),
                        Text(userSelectedAge.toString(), style: infoTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: RoundIconButton(
                                onPressed: () => setState(() {
                                  userSelectedAge--;
                                }),
                                icon: Icon(
                                  FontAwesomeIcons.minus,
                                  size: 20.0
                                ),
                              )
                            ),
                            Expanded(
                              child: RoundIconButton(
                                onPressed: () => setState(() {
                                  userSelectedAge++;
                                }),
                                icon: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 20.0
                                ),
                              )
                            )
                          ],
                        )
                      ]
                    ),
                    color: Color(0xFF1d1E33),
                  )
                )
              ],
            )
          ),
          GestureDetector(
            onTap: () {
              Calculator brain = Calculator(height: userSelectedHeight, weight: userSelectedWeight);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: brain.calculateBMI(),
                    resultText: brain.getResult(),
                    bmiInterpretation: brain.getInterpretation(),
                  );
                })
              );
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              height: kBottomContainerHeight,
              color: bottomContainerColor,
              child: Center(
                child: Text("CALCULATE", style: TextStyle(fontSize: 18.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),),
              )
            ),
          )
        ],
      )
    );
  }
}


class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  RoundIconButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: this.icon,
    );
  }
}
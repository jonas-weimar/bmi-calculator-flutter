import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  ReusableCard({ @required this.color, this.cardChild });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.cardChild, // child that will be passed to the container - shares some similaritys with React 'props.children'
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
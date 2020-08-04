import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  @override
  ReusableCard({this.colour,this.cardChild,this.onpress});
  final Widget cardChild;
  final Color colour;
  final Function onpress;
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onpress, 
      child:Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
      color:colour,
      borderRadius: BorderRadius.circular(10.0)
      ),      
    ),
    );
  }
}


class IconContent extends StatelessWidget {
  IconContent({this.icon,this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 88.0,
        ),
        SizedBox(height:15.0),
        Text(label,
        style: TextStyle(
          fontSize:18.0,
          color:Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}



class RoundActionButton extends StatelessWidget {
  final IconData icon;
  final Function onpress;
  RoundActionButton({this.icon,this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:45.0,
        height:45.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
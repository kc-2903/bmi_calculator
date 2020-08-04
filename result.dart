import 'package:flutter/material.dart';
import 'refactor.dart';
import 'input_page.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final String r;
  final String des;
  Result({this.r,this.des});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title:Center(child:Text('BMI Calculator'),),),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child:Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child:Text('Your Result',style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold),),
          ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour:activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text(r,style: TextStyle(fontSize: 100.0,fontWeight: FontWeight.bold),),
                    Text(des,style: TextStyle(fontSize: 22.0,),),
                 ],  
                ),
               ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>(Bmi())));
                  },
                  child:Container(child:Center(
                  child: Text('Re-Calculate',style: TextStyle(
                    fontSize:25.0, 
                    fontWeight:FontWeight.bold,
                    ),),),
                  color: bottomContainerColour,
                  margin: EdgeInsets.only(top:10.0,),
                  width: double.infinity,
                  height: bottomContainerHeight,
                   ),
                  ),
      ],
      ),
      );
     
  }
}
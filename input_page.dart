import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'refactor.dart';
import 'result.dart';
import 'calc.dart';

const bottomContainerHeight = 60.0;
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);
enum Gender{
  male,female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=70;
  int age=35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('BMI Calculator'),),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child:ReusableCard(
                colour: selectedGender==Gender.male ? activeCardColour:inactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                onpress: (){
                  setState(() {
                    selectedGender=Gender.male;
                  });
                },
              ),
              ),
              Expanded(
                child: ReusableCard(
                colour: selectedGender==Gender.female ? activeCardColour:inactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                onpress: (){
                  setState(() {
                    selectedGender=Gender.female;
                  });
                },
                ),
              ),
            ],
           ),
          ),
          Expanded(child: ReusableCard(
          colour: activeCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text('HEIGHT',style:TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children: <Widget>[
                 Text(height.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900),),
                 Text('cm',style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
               ],
             ),
             Slider(
                   value:height.toDouble() ,
                   min: 120.0,
                   max: 220.0,
                   activeColor: Color(0xFFEB1555),
                   inactiveColor: Color(0xFF8D8E98),
                   onChanged: (double newV){
                     setState(() {
                       height=newV.round();
                     });
                   },
                 ),
           ]
          ,),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: activeCardColour,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style:TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(weight.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900),),
                        Text('kgs',style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundActionButton(
                          icon: FontAwesomeIcons.plus,
                          onpress: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundActionButton(
                          icon: FontAwesomeIcons.minus,
                          onpress: (){
                            setState(() {
                              weight--;
                            });
                          },
                          ),
                      ],
                    ),
                  ],),
                ),),
                Expanded(child: ReusableCard(colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AGE',style:TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(age.toString(),style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.w900),),
                        Text('yrs',style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98),),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundActionButton(
                          icon: FontAwesomeIcons.plus,
                          onpress: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(width: 10.0,),
                        RoundActionButton(
                          icon: FontAwesomeIcons.minus,
                          onpress: (){
                            setState(() {
                              age--;
                            });
                          },
                          ),
                      ],
                    ),
                  ],
                ),
                ),),
            ],
          ),
          ),
          GestureDetector(
            onTap: (){
              Calc cal= Calc(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(r: cal.cb(),des: cal.res(),)));
            },
            child:Container(child:Center(
            child: Text('Calculate',style: TextStyle(
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



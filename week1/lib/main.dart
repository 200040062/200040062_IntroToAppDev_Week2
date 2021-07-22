import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyHomePage(),
));


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
} 
class _MyHomePageState extends State<MyHomePage> {
  int num1=0;
  int num2=0;
  String show = "";
  String result="";
  String operator="" ;
  String temp1="";
  String temp2="";
  void btnclick(String btn){
    if(btn == 'C'){
      show="";
      num1=0;
      num2=0;
      temp1="";
      result="";

    }
    else if(btn=='+'|| btn=='-'||btn=='x'||btn=='/'){
      num1 = int.parse(show);
      temp2="";
      //result="";
      operator=btn;
      temp1 = temp1 + operator;
    }
    else if(btn=='='){
      num2=int.parse(temp2);
      if(operator=='+'){
        result=(num1 + num2).toString();
      }
      if(operator=='-'){
        result=(num1 - num2).toString();
      }
      if(operator=='x'){
        result=(num1 * num2).toString();
      }
      if(operator=='/'){
        result=(num1 / num2).toString();
      }

    }
    else{
      temp1 = show+btn;
      temp2=temp2+btn;
    }
    if(result.length>0){
      temp1=result;
    }
    setState(() {
      show=temp1;
    });
  }
  Widget custombutton(btn){
    return Expanded(
        child: RaisedButton(

          padding: EdgeInsets.all(25.0),

          onPressed: ()=>btnclick(btn),


          color: Colors.black,
          child: Text(
            '${btn}',


            style:TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            )
          ),
        ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text(
          'CALCULATOR',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
        ),
        //centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$show",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10.0,),
                custombutton('9'),
                SizedBox(width: 10.0,),
                custombutton('8'),
                SizedBox(width: 10.0,),
                custombutton('7'),
                SizedBox(width: 10.0,),
                custombutton('+'),
                SizedBox(width: 10.0,),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10.0,),
                custombutton('6'),
                SizedBox(width: 10.0,),
                custombutton('5'),
                SizedBox(width: 10.0,),
                custombutton('4'),
                SizedBox(width: 10.0,),
                custombutton('-'),
                SizedBox(width: 10.0,),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10.0,),
                custombutton('3'),
                SizedBox(width: 10.0,),
                custombutton('2'),
                SizedBox(width: 10.0,),
                custombutton('1'),
                SizedBox(width: 10.0,),
                custombutton('x'),
                SizedBox(width: 10.0,),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10.0,),
                custombutton('C'),
                SizedBox(width: 10.0,),
                custombutton('0'),
                SizedBox(width: 10.0,),
                custombutton('='),
                SizedBox(width: 10.0,),
                custombutton('/'),
                SizedBox(width: 10.0,),
              ],
            ),


          ],
        ),
      )
    );
  }
}

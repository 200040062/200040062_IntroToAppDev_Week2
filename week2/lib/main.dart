
import 'package:flutter/material.dart';
import 'Question.dart';
import 'QuizBrain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF031024),
        appBar: AppBar(
          backgroundColor: Color(0xFF282F39),
          title: Text(
            'QUIZ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          centerTitle: true,
        ),
        body: Quiz(),
      ),
    ));

class Quiz extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Test(),
      ),
    );
  }
}

class Test extends StatefulWidget {


  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Icon> scoreKeeper = [];



  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAns();
    setState(() {
      if (quizBrain.done()) {
        
        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.getNextQues();
      }
    });
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(

            child: Text(
              quizBrain.getQues(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
        ),
        Expanded(

          child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FlatButton(
            color: Colors.green,
            onPressed: (){
              checkAnswer(true);
            },
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
          ),
        ),),
        Expanded(


          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: (){
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

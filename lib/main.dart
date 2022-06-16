import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'question.dart';
import 'options.dart';
import 'optiondata.dart';
import 'questionList.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  //Icons
  static Icon correctAnswer = Icon(Icons.check,color: Colors.green);
  static Icon wrongAnswer = Icon(Icons.close,color: Colors.red);




  List<Icon> scoreKeeper = [];
  final double buttonPadding = 7.0;
  final double buttonFontSize = 17.0;
  final quizList = QuizList();




  void correctOption(i){

    int storeCurrentAnswer = quizList.getQuestionAnswer();

    if(quizList.getQuestionNumber() >= quizList.getAllQuestions().length-1){

      if(storeCurrentAnswer == i){
        scoreKeeper.add(correctAnswer);
      }
      else{
        scoreKeeper.add(wrongAnswer);
      }

      int result = 0;
      for(int i=0;i<scoreKeeper.length-1;i++){
        if(scoreKeeper[i] == correctAnswer){
          result++;
        }
        else{
          continue;
        }

      }
      Alert(
        context: context,
        title: "¡Quiz terminado!",
        desc: "Tu resultado es de $result.",
      ).show();

      setState(() {
      quizList.AlertReset();
      scoreKeeper = [];
      });
    }
    else{

      print(quizList.getAllQuestions().length);
      if(storeCurrentAnswer == i){
        scoreKeeper.add(correctAnswer);
      }
      else{
        scoreKeeper.add(wrongAnswer);
      }
      quizList.nextQuestion();
  }
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizList.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: FlatButton(
              textColor: Colors.green,
              color: Color.fromRGBO(65, 182, 28, 100),
              child: Text(
                optionList[quizList.getQuestionNumber()].questionOption1,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: buttonFontSize,
                ),
              ),
              onPressed: () {
                setState(() {
                  correctOption(1);
                });//The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                optionList[quizList.getQuestionNumber()].questionOption2,
                style: TextStyle(
                  fontSize: buttonFontSize,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  correctOption(2);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: FlatButton(
              color: Colors.orange,
              child: Text(
                optionList[quizList.getQuestionNumber()].questionOption3,
                style: TextStyle(
                  fontSize: buttonFontSize,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  correctOption(3);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: FlatButton(
              color: Colors.blue,
              child: Text(
                optionList[quizList.getQuestionNumber()].questionOption4,
                style: TextStyle(
                  fontSize: buttonFontSize,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  correctOption(4);
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
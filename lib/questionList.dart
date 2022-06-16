import 'package:flutter/cupertino.dart';
import 'question.dart';
import 'main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizList{

  int _questionNumber = 0;
  final List<Question> _questionList = [
    Question(
        q: "¿Cuál de las siguientes NO se considera una indicación para el tratamiento quirúrgico de las fracturas del tercio medio de la clavícula en adultos",
        a: 1
    ),
    Question(
        q: "Niño de 7 años de edad que acude al servicio de urgencias del hospital tras caída en unas camas elásticas",
        a: 1
    ),
    Question(
        q:"Después de un fuerte golpe en la rodilla y sobre todo si la extremidad inferior afectada está apoyando sobre el suelo, puede llegar a producirse la llamada triada desgraciada que afecta a tres elementos de los componentes anatomicos de la articulación de la rodilla, ¿Cuales son éstos?",
        a: 2
    ),
    Question(
        q:"¿Cómo describe la espondiololistesis?",
        a: 4
    ),
    Question(
        q:"¿Cuál es la complicación más grave de las fracturas del cuello femoral?",
        a: 3
    ),
    Question(
        q:"¿Cuál de las siguientes es una osteocondrosis de la cadera?",
        a: 1
    )
  ];

  void nextQuestion(){
    if(_questionNumber<_questionList.length-1) {
      _questionNumber++;
    }
    else{

    }
  }

  AlertReset(){
    _questionNumber = 0;
  }

  getQuestionText(){
    return _questionList[_questionNumber].questionText;
  }

  getQuestionAnswer(){
    return _questionList[_questionNumber].questionAnswer;
  }

  getAllQuestions(){
    return _questionList;
  }

  getQuestionNumber(){
    return _questionNumber;
  }

  isFinished(){
    if(_questionNumber == _questionList.length){
      return true;
    }
    return false;
  }



}
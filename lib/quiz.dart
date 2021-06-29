import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './main_drawer.dart';

class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz>{
  var questionsSet1 = [
    {
      "question": "What's your favorite color",
      "options": [
        {"text": "red", "score": 10},
        {"text": "green", "score": 20},
        {"text": "blue", "score": 30},
        {"text": "yellow", "score": 40}
      ]
    },
    {
      "question": "What's your favorite sport",
      "options": [
        {"text": "football", "score": 10},
        {"text": "hockey", "score": 20},
        {"text": "volleyball", "score": 30},
        {"text": "cricket", "score": 40}
      ]
    },
    {
      "question": "What's your favorite place",
      "options": [
        {"text": "Hyderabad", "score": 10},
        {"text": "chennai", "score": 20},
        {"text": "pune", "score": 30},
        {"text": "Bangalore", "score": 40}
      ]
    }
  ];
  
  var questionsSet2 = [
    {
      "question": "What's your favorite bike company",
      "options": [
        {"text": "beneli", "score": 10},
        {"text": "Honda", "score": 20},
        {"text": "truimph", "score": 30},
        {"text": "Ducati", "score": 40}
      ]
    },
    {
      "question": "What's your favorite phone company",
      "options": [
        {"text": "Nokia", "score": 10},
        {"text": "pixel", "score": 20},
        {"text": "OnePlus", "score": 30},
        {"text": "Apple", "score": 40}
      ]
    },
    {
      "question": "What's your favorite PC company",
      "options": [
        {"text": "Lenovo", "score": 10},
        {"text": "Dell", "score": 20},
        {"text": "HP", "score": 30},
        {"text": "Apple", "score": 40}
      ]
    }
  ];

  int questionNo = 0;
  int score = 0;
  optPressAction(int tempScore) {
    setState(() {
      questionNo = questionNo + 1;
      score += tempScore;
    });
  }

  resetBtn() {
    setState(() {
      score = 0;
      questionNo = 0;
    });
  }
  Widget build(BuildContext context){
    var routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    var questions = questionsSet1;
    if(routeArgs != null)
    {
      questions = routeArgs["questions"]=='1' ? questionsSet1 : questionsSet2 ;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        drawer: Drawer(
          child: MainDrawer()
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(30),
          child: questionNo < questions.length
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                      child: Column(
                        children: [
                          Question(questions[questionNo]["question"]),
                          ...(questions[questionNo]["options"]
                                  as List<Map<String, Object>>)
                              .map((answer) => Answer(
                                  () => optPressAction(answer["score"]),
                                  answer["text"]))
                              .toList(),
                        ],
                      ),
                    ),
                ],
              )
              : Column(
                  children: [
                    Text(
                      "game over!",
                      style: TextStyle(fontSize: 20,),  
                    ),
                    Text(
                      "you're score is: ${score.toString()}",
                      style: TextStyle(fontSize: 20,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: resetBtn,
                      color: Colors.red,
                      child: Text("RESET"),
                    ),
                  ],
                ),
        ),
    );
  }
}
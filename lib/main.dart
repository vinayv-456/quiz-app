import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  var questions = [
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
  int questionNo = 0;
  int score = 0;
  final nameController = TextEditingController();
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

  void submitData() {
    print(nameController.text);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: "Lato",
            fontSize: 20
          )
        )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        drawer: Drawer(child: Text("hello"),),
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
      ),
    );
  }
}

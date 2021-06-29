import 'package:demo_app/quiz.dart';
import 'package:flutter/material.dart';

import './quiz.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
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
      home: Quiz(),  
      routes: {
        '/quiz': (ctx) => Quiz(),
      },
    );
  }
}

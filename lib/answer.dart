import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  String answer;
  Answer(this.selectHandler, this.answer);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: selectHandler,
      color: Colors.blue,
      child: Text(answer),  
      textColor: Colors.white,
    );
  }
}
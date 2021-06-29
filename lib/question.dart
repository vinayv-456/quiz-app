import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  
  Question(this.questionText);

  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Text(
          questionText,
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
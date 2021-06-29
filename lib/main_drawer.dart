import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  

  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text("Select a Quiz", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('quiz-1'),
            onTap: ()=> Navigator.of(context).pushNamed("/quiz", arguments: {"questions": "1"}),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('quiz-2'),
            onTap: () => Navigator.of(context).pushNamed("/quiz", arguments: {"questions": "2"}),
          ),
        ],
      ),
    );
  }
}
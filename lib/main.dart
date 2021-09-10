import 'package:flutter/material.dart';

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
  List<Icon> scoreKeeper = new List();
  List<String> questions = ["Question 1","question 2","Question 3","Question 4","Question 5","end"];
  List<bool> answers = [true,false,false,true,true];
  int qIndex = 0;
  int aIndex = 0;
  Icon correct = Icon(Icons.check,color: Colors.green,);
  Icon wrong = Icon(Icons.close,color: Colors.red,);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions[qIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if(scoreKeeper.length == 15){
                      scoreKeeper.clear();
                    }
                    if(aIndex<answers.length && answers[aIndex]==true) {
                      scoreKeeper.add(correct);
                      qIndex++;
                      aIndex++;
                    }
                    else if(aIndex<answers.length && answers[aIndex]==false){
                      scoreKeeper.add(wrong);
                      qIndex++;
                      aIndex++;
                    }
                  });
                  //The user picked true.
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  setState(() {
                    if(scoreKeeper.length == 15){
                      scoreKeeper.clear();
                    }
                    if(aIndex<answers.length && answers[aIndex]==false) {
                      scoreKeeper.add(correct);
                      qIndex++;
                      aIndex++;
                    }
                    else if(aIndex<answers.length && answers[aIndex]==true){
                      scoreKeeper.add(wrong);
                      qIndex++;
                      aIndex++;
                    }
                  });
                },
              ),
            ),
          ),
          //TODO: Add a Row here as your score keeper

          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

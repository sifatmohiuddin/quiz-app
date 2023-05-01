
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';


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

Quizbrain quizbrain= Quizbrain();

class _QuizPageState extends State<QuizPage> {
  List <Icon> scoreKeeper= [
    ];

  void iconcheck(bool rightwrong){
    bool correctAnswer = quizbrain.getans();

    setState(() {

      if(quizbrain.isFinised() == true) {

            Alert(context: context,
                title: "Finished", desc: "You have finished the quiz.").show();

        quizbrain.reset();

        scoreKeeper = [];
      }

      else {
        if (correctAnswer == rightwrong) {
          scoreKeeper.add(
              Icon(Icons.check,
                color: Colors.green,));
        }
        else {
          scoreKeeper.add(
              Icon(Icons.close,
                color: Colors.red,));
        }
        quizbrain.nextquestion();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
            quizbrain.getquiz(),
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
         child: TextButton(
           child: Container(
             height: 80,
                  width: 400,
                  color: Colors.green,
             padding: EdgeInsets.all(30),
             child: Center(
               child: Text('True',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20
                 )

               ),
             )

                ),
                onPressed: () {

                  iconcheck(true);
                },
              ),
       ),
        Expanded(
          child: TextButton(
            child: Container(
                height: 80,
                width: 400,
                color: Colors.red,
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Text('False',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      )

                  ),
                ),




            ),
            onPressed: () {

             iconcheck(false);

              //The user picked true.
            },
          ),
        ),
        Row(
     children:

          scoreKeeper,









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

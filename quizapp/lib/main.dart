import 'package:quizapp/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionbank.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Center(
          child: Text(
        'QUIZ APP',
        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cormorant'),
      )),
      backgroundColor: Colors.white10,
    ),
    body: QuizPage(),
    backgroundColor: Colors.black12,
  )));
}

class QuizPage extends StatefulWidget {    //QuizPage class is derived from StatefulWidget class //INHERITANCE
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int questionnumber=0;
  Questions que= Questions();  //que object created of class questions
  void checkanswer( bool usersanswer) {
    bool correctanswer=que.getanswers(); //.answers because it expects a boolean value
    if(correctanswer==usersanswer){
                           trackscore.add(Icon(Icons.check));
                             }
                             else
                           trackscore.add(Icon(Icons.close));
  }

  List<Widget> trackscore=[];

  @override        // This StatefulWidget class has method called build which is overridden by derived class QuizPAge  //POLYMORPHISM
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  que.getquestions(),  // .question is because text expects string #que. means objec accessing using dot 
                  style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Cormorant'),
                ),
              )),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      checkanswer(true);
                      setState(() {
                          if (que.isend() == true){
                                Alert(context: context, title: "Thank you!!", desc: "The list of questions has came to an end").show();
                                que.returnback();
                                trackscore=[]; } 
                          else {
                           que.nextquestion();
                          }
                      });  
                    },
                    child: Text(
                      'True',
                      style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cormorant'),
                    ),
                  )),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Container(
                height: 20.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: () {
                    checkanswer(false);
                    setState(() {
                      if (que.isend()==true){
                        Alert(context: context, title: "Thank you!!", desc: "The list of questions has came to an end.").show();
                        que.returnback();
                        trackscore=[];   // empty the trackscore
                      }
                      else{
                      que.nextquestion(); }
                    });
                    
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cormorant'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height:10.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,  // MUST GIVE THE SCROLL DIRECTION FOR SingleChildScrollView to work
            child: Row( children : trackscore,)),  // Wrapped with single child scrollview to avoid row overflow
          SizedBox(
            height: 10.0,
          ),
        ]);
  }
}

import 'dart:js';

import 'package:flutter/cupertino.dart';

import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Questions {
List<Question>  _questionbank=[
    Question(q:'A cross between a horse and a zebra is called a Hobra', a: false,),
    Question(q: 'The black box in a plane is black.', a: false,),
    Question(q: 'Alliumphobia is a fear of garlic.', a: true,),
    Question(q: 'About 36 and 42 islands make up New York City',a: true),
    Question(q: 'Only one capital exists in South Africa', a: false),
    Question(q: 'The largest ocean in the world is the Atlantic Ocean', a: false),
    Question(q: 'The tallest mountain in the world is Mount Everest', a: true),
    Question(q: 'California is home to the “Desert of Death” ', a: false),
    Question(q: '13,171 miles is how far the Great Wall of China stretches in total', a:false),
    Question(q: 'The Mississippi and the Nile are the two longest rivers in the world', a: false),
    Question(q: 'The 31.5-mile-long Chunnel connects England and France',  a:true),
    Question(q: 'The world’s largest island is Greenland', a:true),
    Question(q: 'South America has more nations than Africa has', a:false),
    Question(q: 'Of all the states in the union, Alaska has the most active volcanoes', a:true),
    Question(q: 'The world’s longest coastline is in China', a: false),
    Question(q:'Some cats are actually allergic to humans',a: true),
    Question(q:'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q:'Approximately one quarter of human bones are in the feet.', a: true),
    Question(q:'A slug\'s blood is green.', a: true),
    Question(q:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q:'It is illegal to pee in the Ocean in Portugal.', a:true),
    Question(
        q:'No piece of square dry paper can be folded in half more than 7 times.',
        a:false),
    Question(
        q:'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a:true),
    Question(
        q:'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q:'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q:'Google was originally called \"Backrub\".', a: true),
    Question(
        q:'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q:'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];
  
  int _questionnumber =0;
    String getquestions() {
      return _questionbank[_questionnumber].questions; //I added .questions as the error was that the getter get question whose return type is 
                                                      // string cannot return Question type. .queation is string type so I added 
    }
    bool getanswers() {
      return _questionbank[_questionnumber].answers;  // getter functions are used as the answers can be altered by writing certain code 
    }                                                // which make our code less reliable. So, by using the concept of data hiding/encapsulation 
    void nextquestion() {
      if (_questionnumber<_questionbank.length-1){   // to prevent our app from crashing  #12<12 condition at last
        _questionnumber++;
      }
    }
    bool isend() {
      if(_questionnumber>= _questionbank.length-1){
        return true;
      }
      else{
        return false;
      }
    }
    int returnback() {
       return _questionnumber=0;
    }
}

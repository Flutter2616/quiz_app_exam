import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:quiz_app_exam/modal/quiz_modal.dart';
import 'package:quiz_app_exam/utils/helper_class.dart';

class Quizprovider extends ChangeNotifier
{
  List levellist=["easy","medium","hard"];
  List optionlist=[];
  List randomlist=[];
  int i=1;
  Future<Quizmodal> quiz_Api_calling(String level)
   async {
    return await Helper.helper.quiz_Api(level);
  }

  void random_Option(List<String>? falseans, String? trueans)
  {
    optionlist.clear();
    randomlist.clear();
    optionlist=List.from(falseans!);
    optionlist.add(trueans);
    print("${optionlist.length}==========");

    for(int k=0;k<4;k++)
      {
        Random random=Random();
        int number=random.nextInt(optionlist.length);
        randomlist.add(optionlist[number]);
        optionlist.removeAt(number);
      }
    print("${randomlist.length}==========");
    notifyListeners();
  }

  void i_add()
  {
    i++;
    optionlist.clear();
    randomlist.clear();
    print("${i}================");
    notifyListeners();
  }

  void start()
  {
    i=1;
    notifyListeners();
  }


}
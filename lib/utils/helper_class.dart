import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app_exam/modal/quiz_modal.dart';

class Helper
{
  static Helper helper=Helper();
  Future<Quizmodal> quiz_Api(String level)
  async {
    String link="https://opentdb.com/api.php?amount=10&category=27&difficulty=$level&type=multiple";
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    Quizmodal? q;
    q=Quizmodal.fromJson(json);
    return q;
  }
}
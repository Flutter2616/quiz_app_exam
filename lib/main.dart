import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_exam/provider/quiz_provider.dart';
import 'package:quiz_app_exam/view/home_screen.dart';
import 'package:quiz_app_exam/view/level_screen.dart';
import 'package:quiz_app_exam/view/splash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Quizprovider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'level',
          routes: {
            '/':(context) => Splashscreen(),
            'level':(context) => Levelscreen(),
            'home':(context) => Homescreen(),
          },
        ),
      ),
    ),
  );
}

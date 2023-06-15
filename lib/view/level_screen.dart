import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_exam/modal/quiz_modal.dart';
import 'package:quiz_app_exam/provider/quiz_provider.dart';
import 'package:sizer/sizer.dart';

Quizprovider? qf;
Quizprovider? qt;


class Levelscreen extends StatefulWidget {
  const Levelscreen({super.key});

  @override
  State<Levelscreen> createState() => _LevelscreenState();
}

class _LevelscreenState extends State<Levelscreen> {
  @override
  Widget build(BuildContext context) {
    qf = Provider.of<Quizprovider>(context, listen: false);
    qt = Provider.of<Quizprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100.h,
          width: 100.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xe7000000),
            image: DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: qf!.levellist
                .map((e) => InkWell(onTap: () {
                  Navigator.pushReplacementNamed(context, 'home',arguments: e);
                },
                  child: Container(
                        height: 6.h,
                        width: 50.w,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text("$e",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w500)),
                      ),
                ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

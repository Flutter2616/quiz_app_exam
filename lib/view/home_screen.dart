import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app_exam/modal/quiz_modal.dart';
import 'package:quiz_app_exam/provider/quiz_provider.dart';
import 'package:quiz_app_exam/view/level_screen.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    qf = Provider.of<Quizprovider>(context, listen: false);
    qt = Provider.of<Quizprovider>(context, listen: true);
    String level = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: qf!.quiz_Api_calling(level),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              Quizmodal q = snapshot.data!;
              // print("${q.responseCode}=================");
              return Container(
                height: 100.h,
                width: 100.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xe7000000),
                  image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"), fit: BoxFit.fill),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'level');
                              qf!.start();
                            },
                            child: Icon(Icons.arrow_back_ios_new,
                                color: Colors.white, size: 20.sp),
                          ),
                          TextButton(
                              onPressed: () {
                                // qf!.random_Option(
                                //     q.results![qt!.i].incorrectAnswers,
                                //     q.results![qt!.i].correctAnswer);
                                qt!.i_add();
                              },
                              child: Text(
                                "skip",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Question ${qt!.i}/${q.results!.length}",
                        style: TextStyle(
                            color: Colors.grey.shade200,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 5),
                      Divider(
                          height: 1, color: Colors.grey.shade200, thickness: 2),
                      SizedBox(height: 20),
                      Container(
                        width: 100.w,
                        height: 78.h,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${q.results![qt!.i].question}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 20),
                            qt!.randomlist.length == 0
                                ? InkWell(
                                    onTap: () {
                                      qf!.random_Option(
                                          q.results![qt!.i].incorrectAnswers,
                                          q.results![qt!.i].correctAnswer);
                                    },
                                    child: Container(
                                      width: 50.w,
                                      height: 7.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.black, width: 2)),
                                      child: Text("Show answer",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: qt!.randomlist
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: InkWell(
                                                onTap: () {
                                                  // if (q.results![qt!.i]
                                                  //     .correctAnswer ==
                                                  //     qt!.randomlist[e]) {
                                                  //   qf!.i_add();
                                                  // } else {
                                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  //       content: Text(
                                                  //           "Your option is wrong",
                                                  //           style: TextStyle(
                                                  //               color: Colors
                                                  //                   .white,
                                                  //               fontWeight:
                                                  //               FontWeight
                                                  //                   .w500,
                                                  //               fontSize: 15
                                                  //                   .sp)),
                                                  //       backgroundColor:
                                                  //       Colors.red
                                                  //           .shade900,
                                                  //       behavior:
                                                  //       SnackBarBehavior
                                                  //           .floating));
                                                  //   qf!.i_add();
                                                  // }
                                                },
                                                child: Container(
                                                    width: 50.w,
                                                    height: 7.h,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 2)),
                                                    child: Text("$e",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500))),
                                              ),
                                            ))
                                        .toList(),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:venonweb/controllers/CalendarController.dart';
import 'package:flutter/material.dart';
import 'package:venonweb/screens/general-components/general-components.dart';
import 'package:venonweb/screens/main/components/side_menu.dart';

import '../../helper.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarController c = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: kernel(
          "Takvim",
          context,
          SafeArea(
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      /* lines.isEmpty
                    ? Container()
                    : Container(
                        width: screenW(1, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: lines,
                        )), */
                      GetBuilder<CalendarController>(
                          init:
                              CalendarController(), // INIT IT ONLY THE FIRST TIME
                          initState: (_) => CalendarController,
                          builder: (_) => Container(
                              height: screenH(0.8, context),
                              width: screenW(0.6, context),
                              child: SingleChildScrollView(
                                child: Container(
                                  width: screenW(0.1, context),
                                  height: screenW(0.6, context),
                                  child: GridView.count(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      crossAxisCount: (c.shift + 1),
                                      children: List.generate(c.square.length,
                                          (index) {
                                        return GestureDetector(
                                          onTap: () {
                                            c.click(index);
                                          },
                                          child: Container(
                                            decoration: (index / c.shift) < 1
                                                ? BoxDecoration()
                                                : BoxDecoration(
                                                    border: Border.all(
                                                        width: 0,
                                                        color: Colors.grey),
                                                  ),
                                            child: Center(
                                              child: (index / c.shift) > 1
                                                  ? (index % (c.shift + 1)) == 0
                                                      ? Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              c.square[index]
                                                                  .date.day
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8),
                                                            ),
                                                            Text(
                                                              DateFormat.EEEE()
                                                                  .format(c
                                                                      .square[
                                                                          index]
                                                                      .date),
                                                              /*  formatDate(
                                                                  c
                                                                      .square[
                                                                          index]
                                                                      .date,
                                                                  [
                                                                    DD
                                                                  ]).substring(
                                                                  0, 3), */
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8),
                                                            ),
                                                          ],
                                                        )
                                                      : Container(
                                                          color: c.square[index]
                                                                      .appointment ==
                                                                  true
                                                              ? Colors.blue
                                                              : c.square[index]
                                                                          .availablity ==
                                                                      true
                                                                  ? Colors.green
                                                                  : Colors.grey
                                                                      .shade600,
                                                          /* child: Text(
                                                            c.square[index].date
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 8),
                                                          ), */
                                                        )
                                                  : index == 0
                                                      ? Container()
                                                      : Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              formatDate(
                                                                  c
                                                                      .square[
                                                                          index]
                                                                      .date,
                                                                  [
                                                                    HH,
                                                                    ":",
                                                                    nn
                                                                  ]),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8),
                                                            ),
                                                            Text(
                                                              formatDate(
                                                                  c
                                                                      .square[
                                                                          index]
                                                                      .date
                                                                      .add(Duration(
                                                                          minutes: 90)),
                                                                  [
                                                                    HH,
                                                                    ":",
                                                                    nn
                                                                  ]),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8),
                                                            ),
                                                          ],
                                                        ),
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                              )))
                    ],
                  )))),
    );
  }
}

/* 
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:venonweb/helper.dart';

class CalendarScreen extends StatefulWidget {
  CalendarScreen({Key? key}) : super(key: key);

  @override
  _TakvimState createState() => _TakvimState();
}

class _TakvimState extends State<CalendarScreen> {
  DateTime starttime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 0, 0, 0, 0, 0);
  late DateTime time;
  var availableDates = <DateTime>[];
  @override
  void initState() {
    super.initState();
    availableDates.add(DateTime(2021, 7, 19, 0, 0, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 20, 0, 30, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 21, 1, 0, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 22, 1, 30, 0, 0, 0));
    time = starttime;
    print(formatDate(time, [HH, ":", nn]));
    days();
    hours();
  }

  var lines = <Widget>[];
  days() {
    DateTime gunSay = DateTime.now();
    for (var i = 0; i < 7; i++) {
      lines.add(
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.grey),
              ),
              padding: EdgeInsets.only(right: 4),
              child: Text(formatDate(gunSay, [dd]))),
        ),
      );
      gunSay = gunSay.add(Duration(days: 1));
    }
    setState(() {
      lines = lines;
    });
  }

  var square = <Square>[];
  hours() {
    for (var i = 0; i < 8; i++) {
      for (var k = 0; k < 49; k++) {
        bool maybe = false;
        for (var item in availableDates) {
          if (item == time) {
            maybe = true;
            break;
          }
        }
        if (maybe == true) {
          square.add(Square(date: time, availablity: true, appointment: false));
        } else {
          square
              .add(Square(date: time, availablity: false, appointment: false));
        }

        if (k == 0 || k % 49 == 0) {
        } else {
          time = time.add(Duration(minutes: 30));
        }
      }
    }
    setState(() {
      square = square;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                /* lines.isEmpty
                    ? Container()
                    : Container(
                        width: screenW(1, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: lines,
                        )), */
                square.isEmpty
                    ? Container()
                    : Container(
                        height: screenH(0.8, context),
                        child: SingleChildScrollView(
                          child: Container(
                            width: screenW(0.6, context),
                            height: screenW(3.6, context),
                            child: GridView.count(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                crossAxisCount: 49,
                                children: List.generate(square.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print(formatDate(square[index].date,
                                          [dd, "-", HH, ":", nn]));
                                      if (square[index].availablity == true) {
                                        if (square[index].appointment == true) {
                                          setState(() {
                                            square[index] = Square(
                                                date: square[index].date,
                                                availablity:
                                                    square[index].availablity,
                                                appointment: false);
                                          });
                                        } else {
                                          setState(() {
                                            square[index] = Square(
                                                date: square[index].date,
                                                availablity:
                                                    square[index].availablity,
                                                appointment: true);
                                          });
                                        }
                                      }
                                    },
                                    child: Container(
                                      decoration: (index / 48) < 1
                                          ? BoxDecoration()
                                          : BoxDecoration(
                                              border: Border.all(
                                                  width: 0, color: Colors.grey),
                                            ),
                                      child: Center(
                                        child: (index / 48) > 1
                                            ? (index % 49) == 0
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        square[index]
                                                            .date
                                                            .day
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                      Text(
                                                        formatDate(
                                                            square[index].date,
                                                            [
                                                              DD
                                                            ]).substring(0, 3),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                    ],
                                                  )
                                                : Container(
                                                    color: square[index]
                                                                .appointment ==
                                                            true
                                                        ? Colors.blue
                                                        : square[index]
                                                                    .availablity ==
                                                                true
                                                            ? Col.lightSage
                                                            : Colors
                                                                .grey.shade600
                                                    /* child: Text(
                                                      formatDate(square[index],
                                                          [HH, ":", nn]),
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 8),
                                                    ), */
                                                    )
                                            : index == 0
                                                ? Container()
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        formatDate(
                                                            square[index].date,
                                                            [HH, ":", nn]),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                      Text(
                                                        formatDate(
                                                            square[index]
                                                                .date
                                                                .add(Duration(
                                                                    minutes:
                                                                        30)),
                                                            [HH, ":", nn]),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                    ],
                                                  ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                        ))
              ],
            )));
  }
}

class Square {
  Square(
      {required this.date,
      required this.availablity,
      required this.appointment});

  DateTime date;
  bool availablity;
  bool appointment;
}

class Col {
  static const steel30 = const Color(0x4d898d94);
  static const robinsEggBlue = const Color(0xff95e1f1);
  static const cornflowerBlue = const Color(0xff6797dd);
  static const cornflowerBlueTwo = const Color(0xff4280da);
  static const dullYellow = const Color(0xfff0de4c);
  static const butterscotch = const Color(0xfffbb948);
  static const dullOrange = const Color(0xffdd6e30);
  static const peach = const Color(0xffffbf8c);
  static const coral = const Color(0xfff04c4c);
  static const greenyBlue = const Color(0xff41b8bb);
  static const lightGreyGreen = const Color(0xffd0daa8);
  static const duskBlue30 = const Color(0x4d2d5a9c);
  static const sea61 = const Color(0x9b2f8fa1);
  static const darkGreyBlue20 = const Color(0x33353a6c);
  static const lightBlueGrey = const Color(0xffcad9f3);
  static const iceBlue = const Color(0xffeaf2ff);
  static const paleGrey = const Color(0xffdce0e7);
  static const darkGreyBlueTwo = const Color(0xff2d3857);
  static const darkSkyBlue = const Color(0xff3b93e8);
  static const darkGreyBlueThree = const Color(0xff334062);
  static const silver = const Color(0xffd7d8e0);
  static const cloudyBlue = const Color(0xffbcc6d5);
  static const seafoamBlue = const Color(0xff59d1a5);
  static const paleGreyTwo = const Color(0xffe2e8f2);
  static const white6 = const Color(0x0f000000);
  static const warmGrey = const Color(0xff979797);
  static const darkSkyBlueTwo = const Color(0xff3488e5);
  static const cloudyBlueTwo = const Color(0xffd5d9e3);
  static const dusk = const Color(0xff3b496d);
  static const white = const Color(0xffffffff);
  static const leaf = const Color(0xff7fae31);
  static const white = const Color(0xff000000);
  static const lightNavy = const Color(0xff183e75);
  static const lightSage = const Color(0xffc3eaad);
  static const orangeyRed = const Color(0xfff23d3d);
  static const paleGreyThree = const Color(0xffdde4ee);
  static const darkGreyBlue = const Color(0xff28314d);
  static const paleGreyFour = const Color(0xfff1f2f8);
}
 */

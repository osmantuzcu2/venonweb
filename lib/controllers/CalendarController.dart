import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:venonweb/models/calendar.dart';
import 'package:date_format/date_format.dart';

class CalendarController extends GetxController {
  DateTime starttime = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 8, 0, 0, 0, 0);
  late DateTime time;
  var availableDates = <DateTime>[];
  int shift = 8;
  @override
  void onInit() {
    // called immediately after the widget is allocated memory
    init();
    super.onInit();
  }

  void init() {
    print("works");
    availableDates.add(DateTime(2021, 7, 19, 8, 0, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 20, 9, 30, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 21, 11, 0, 0, 0, 0));
    availableDates.add(DateTime(2021, 7, 22, 12, 30, 0, 0, 0));
    time = starttime;
    days();
    hours();
    initializeDateFormatting();
  }

  void click(int index) {
    print(formatDate(square[index].date, [dd, "-", HH, ":", nn]));
    if (square[index].availablity == true) {
      if (square[index].appointment == true) {
        square[index] = Square(
            date: square[index].date,
            availablity: square[index].availablity,
            appointment: false);
      } else {
        square[index] = Square(
            date: square[index].date,
            availablity: square[index].availablity,
            appointment: true);
      }
    }
    update();
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
    /*  setState(() {
      lines = lines;
    }); */
  }

  List square = <Square>[];
  hours() {
    for (var i = 0; i < shift; i++) {
      for (var k = 0; k < shift + 1; k++) {
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

        if (k == 0 || k % shift + 1 == 0) {
        } else {
          time = time.add(Duration(minutes: 90));
        }
      }
      time = time.add(Duration(hours: 12));
    }
    /* setState(() {
      square = square;
    }); */
  }
}

//This class holds all the static util methods that is used within the app//

// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';


///Utils class
class Utils {
  //Call these variables to get initialized screen sizes//

  ///app bar height
  static final double appBarHeight = AppBar().preferredSize.height;

  ///status bar height
  static double statusBarHeight;

  ///total screen height without appbar or status bar
  static double totalBodyHeight;

  ///body height with appbar and status bar reduced
  static double reducedBodyHeight;

  ///body height with status bar reduced
  static double contentBodyHeight;

  ///total screen width
  static double bodyWidth;

  ///Set once in splash screen
  static setScreenSizes(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    bodyWidth = MediaQuery.of(context).size.width;
    totalBodyHeight = MediaQuery.of(context).size.height;
    print(totalBodyHeight);
    reducedBodyHeight = totalBodyHeight - appBarHeight - statusBarHeight;
    totalBodyHeight = reducedBodyHeight;
    print(totalBodyHeight);
    contentBodyHeight = reducedBodyHeight - statusBarHeight;
  }

  ///separate paragraph by lines
  static List<String> getBullets(String text, [String escape = '\r\n\r\n']) =>
      text.split(escape);

  ///convert date time
  static String convertDateTime(String dateTime,
      [String format = 'dd-MMM-yyyy']) {
    final DateTime date = DateTime.parse(dateTime);
    return DateFormat(format).format(date).toString();
  }

  ///get today, yesterday other wise date
  static String checkDateIsTodayYesterday(String dateTime) {
    final DateTime date = DateTime.parse(dateTime);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    var value = '';
    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate == today) {
      value = 'Today';
    } else if (aDate == yesterday) {
      value = 'Yesterday';
    } else {
      value = convertDateTime(dateTime, 'dd/MM/yyyy');
    }

    return value;
  }

  ///convert distance to m and km
  static String convertDistance(double distance) {
    if (distance < 1) {
      return '${(distance * 1000).toInt()} m';
    }
    return '${distance.toStringAsFixed(1)} km';
  }

  ///get random number within range
  static int getRandomNumber({int range = 2}) {
    final r = Random();
    final int random = r.nextInt(range);
    return random;
  }
}

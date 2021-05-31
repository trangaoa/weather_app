import 'package:flutter/cupertino.dart';

class DayDetails {
  String day;
  String description;
  var dayMin, dayMax;
  String temp_min, temp_max;

  DayDetails({
    @required this.day,
    @required this.description,
    @required this.dayMin,
    @required this.dayMax,
    @required this.temp_min,
    @required this.temp_max,
  });
}
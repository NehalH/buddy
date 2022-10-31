import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String USN = " ";
String name = " ";
Color blue= Colors.blue;
Color white= Colors.white;
Color green= Colors.green;
Color black= Colors.black;
Color attPer= Colors.black38;
double radius = 20;
double attRadius= 40;
late Image tt;
var count= [0,0,0,0,0,0,0,0,0,0];
var subs= ['-','-','-','-','-','-','-','-','-','-'];
int current= 0;
late List<List<String>> dates;
late List tempDates;
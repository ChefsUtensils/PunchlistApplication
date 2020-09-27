import 'package:flutter/material.dart';

class Assignment{

  String name;
  String job;
  String area;
  String sub;
  String details;
  DateTime start;
  DateTime finished;
  DateTime actualStart;
  DateTime actualFinish;
  bool completed;

 Assignment(String name, String job, String area, String sub, String details){
   this.name = name;
   this.job = job;
   this.area = area;
   this.sub = sub;
   this.details = details;
   completed = false;
 }

 

}
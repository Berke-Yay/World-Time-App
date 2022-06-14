import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String flag;
  String time="";
  String url;
  bool isDay = true;

  WorldTime({required this.location, required this.flag, required this.url });
  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime=data["datetime"];
      String offset=data["utc_offset"].substring(1,3);
      //print(datetime);
      //print(offset);
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isDay= now.hour>6 && now.hour<20 ? true: false;
      time = DateFormat.jm().format(now);
    }
    catch(a){
      print("caught error: $a");
      time="couldn't get the time";
    }

  }

}
WorldTime instance = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
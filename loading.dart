import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class loadingPage extends StatefulWidget {
  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  String time = "loading";
void SetupWorldTime() async{
   WorldTime instance = WorldTime(location: "Istanbul", flag: "turkey.png", url: "Europe/Istanbul");
   await instance.getTime();
   Navigator.pushReplacementNamed(context, "/home", arguments: {
     "location": instance.location,
     "time": instance.time,
     "flag": instance.flag,
     "isDay": instance.isDay,
   });
}
  @override
  void initState(){
    super.initState();
    SetupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

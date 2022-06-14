import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
class locationPage extends StatefulWidget {
  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
List<WorldTime> locations = [
  WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin"),
  WorldTime(location: "London", flag: "england.png", url: "Europe/London"),
  WorldTime(location: "Istanbul", flag: "turkey.png", url: "Europe/Istanbul"),
  WorldTime(location: "Rome", flag: "italy.png", url: "Europe/Rome"),
  WorldTime(location: "Paris", flag: "france.png", url: "Europe/Paris"),
];
void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();
  Navigator.pop(context, {
    "location": instance.location,
    "time": instance.time,
    "flag": instance.flag,
    "isDay": instance.isDay,
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){
              updateTime(index);
            },
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/${locations[index].flag}"),
            ),
          ),
        );
    },
    ),
    );
        }
  }

import 'package:flutter/material.dart';
class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Map data={};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String background = data["isDay"] ? "day.png": "night.png";
    Color? bgColor = data["isDay"] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$background"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 120, 0, 0 ),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[700],
                  ),
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data={
                        "time": result["time"],
                        "location": result["location"],
                        "isDay": result["isDay"],
                        "flag": result["flag"],
                      };
                    });
                  },
                  label: Text(
                      "Edit location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 66,
                  ),
                ),
            ],
      ),
          ),
        ),
    ),
    );
  }
}

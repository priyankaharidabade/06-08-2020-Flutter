import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:characters/characters.dart';

void main() {
  runApp(MyApp());
}

var mydata;
web(mycmd) async {
  var url = "http://192.168.43.19/cgi-bin/web.py?x=${mycmd}";
  var response = await http.get(url);
  var mydata = response.body;
  print(response.body);
  print(mydata);
}

class MyApp extends StatelessWidget {
  String cmd;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) => {cmd = value},
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter ur Docker OS name",
                    prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    web(cmd);
                  },
                  child: Text("Click here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

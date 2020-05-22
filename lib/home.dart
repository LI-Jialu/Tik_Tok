import 'dart:async';
import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var timeout = const Duration(seconds: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
//          padding: EdgeInsets.only(
//              left: SizeConfig.safeBlockHorizontal * 5,
//              right: SizeConfig.safeBlockHorizontal * 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.play_arrow), onPressed: null),
                  Text("Start"),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.pause), onPressed: null),
                  Text("Break"),
                  IconButton(icon: Icon(Icons.stop), onPressed: null),
                  Text("End"),
                ],
              ),
              Container(
                child: Text('TOTAL WORK TIME'),
              ),
              Container(
                child: Text('BREAK'),
              ),
              SizedBox(
                height: 210,
                child: Card(
                  child: Column(
                    children: [
                      Ink(
                        color: Colors.blueAccent,
                        child: ListTile(
                          title:
                              Text('CATOGORY', style: TextStyle(fontSize: 10)),
                          subtitle: Text('Study',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ),
                      ),
                      Ink(
                        color: Colors.blue,
                        child: ListTile(
                          title:
                              Text('PROJECT', style: TextStyle(fontSize: 10)),
                          subtitle: Text('ESTR2002',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ),
                      ),
                      Ink(
                        color: Colors.lightBlueAccent,
                        child: ListTile(
                          title: Text('TASK', style: TextStyle(fontSize: 10)),
                          subtitle: Text('HW1',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

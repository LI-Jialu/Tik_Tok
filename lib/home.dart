import 'dart:async';
import 'package:flutter/material.dart';
import 'size_config.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const duration = const Duration(seconds: 1);
  int defaultTime = 0;

  int workSecondsPassed = 0;

  int breakSecondsPassed = 0;
  bool isWorking = false;
  bool isBreaking = false;
  bool isStopped = true;

  Timer workTimer;
  Timer breakTimer;

  void handleTick() {
    if (isWorking) {
      setState(() {
        workSecondsPassed = workSecondsPassed + 1;
      });
    } else if (isBreaking) {
      setState(() {
        breakSecondsPassed = breakSecondsPassed + 1;
      });
    } else if (isStopped) {
      setState(() {
        workSecondsPassed = 0;
        breakSecondsPassed = 0;
        defaultTime = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (workTimer == null)
      workTimer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int workHours = workSecondsPassed ~/ (60 * 60);
    int workMinutes = workSecondsPassed % (60 * 60) ~/ 60;
    int workSeconds = workSecondsPassed % 60;
    int breakHours = breakSecondsPassed ~/ (60 * 60);
    int breakMinutes = breakSecondsPassed % (60 * 60) ~/ 60;
    int breakSeconds = breakSecondsPassed % 60;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
//          padding: EdgeInsets.only(
//              left: SizeConfig.safeBlockHorizontal * 5,
//              right: SizeConfig.safeBlockHorizontal * 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isWorking = true;
                        isBreaking = false;
                        isStopped = false;
                      });
                    }),
                Text("Start"),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    setState(() {
                      isWorking = false;
                      isBreaking = true;
                      isStopped = false;
                    });
                  },
                ),
                Text("Break"),
                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: () {
                    setState(() {
                      isWorking = false;
                      isBreaking = false;
                      isStopped = true;
                    });
                  },
                ),
                Text("End"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextContainer(
                    label: 'HH', value: workHours.toString().padLeft(2, '0')),
                CustomTextContainer(
                    label: 'MM', value: workMinutes.toString().padLeft(2, '0')),
                CustomTextContainer(
                    label: 'SS', value: workSeconds.toString().padLeft(2, '0')),
              ],
            ),
            Container(
              child: Text('TOTAL WORK TIME'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextContainer(
                    label: 'HH', value: breakHours.toString().padLeft(2, '0')),
                CustomTextContainer(
                    label: 'MM',
                    value: breakMinutes.toString().padLeft(2, '0')),
                CustomTextContainer(
                    label: 'SS',
                    value: breakSeconds.toString().padLeft(2, '0')),
              ],
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
                        title: Text('CATOGORY', style: TextStyle(fontSize: 10)),
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
                        title: Text('PROJECT', style: TextStyle(fontSize: 10)),
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
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.all(22),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

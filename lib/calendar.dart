import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    _controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                todayColor: Color(0xFFC6DEF1),
                selectedColor: Theme.of(context).primaryColor,
              ),
              calendarController: _controller,
              headerStyle: HeaderStyle(
                formatButtonDecoration: BoxDecoration(
                  color: Color(0xFFC6DEF1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonShowsNext: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}

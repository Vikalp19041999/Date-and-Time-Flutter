import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030));

    if (picked != null && picked != _date) {
      print('Date Selected : ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null && picked != _time) {
      print('Time Selected : ${_time.toString()}');
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date and Time in Flutter'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Date Selected : ${_date.toString()}'),
            RaisedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Select Date')),
            Text('Time Selected : ${_time.toString()}'),
            RaisedButton(
                onPressed: () {
                  _selectTime(context);
                },
                child: Text('Select Time'))
          ],
        ),
      ),
    );
  }
}

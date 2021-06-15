import 'package:flutter/material.dart';

class ScheduleRow extends StatefulWidget {
  final data;
  const ScheduleRow({this.data});

  @override
  State<StatefulWidget> createState() {
    return ScheduleRowState();
  }
}

class ScheduleRowState extends State<ScheduleRow> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(widget.data["hour"]["id"].toString()))),
          Expanded(
              child: Text(widget.data["hour"]["from"].toString())),
          Expanded(child: Text(widget.data["hour"]["to"].toString())),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(widget.data["subject"]))),
        ],
      ),
    );
  }
}

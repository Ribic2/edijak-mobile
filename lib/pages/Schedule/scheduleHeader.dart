import 'package:flutter/material.dart';

class ScheduleHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(child: Text("Ura")),
          Expanded(child: Text("Od")),
          Expanded(child: Text("Do")),
          Expanded(child: Text("Predmet")),
        ],
      ),
    );
  }
}

import 'package:edijak_mobile/components/bar.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    throw MessagesState();
  }
}

class MessagesState extends State<Messages>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(
        title: Text("Edijak"),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../pages/login.dart' as Login;
import '../pages/Events/index.dart' as Events;
import '../pages/index.dart' as Index;

class Routes extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Events.MessageScreen(),
        '/webapp': (context) => Index.Index(),
      },
    );
  }
}
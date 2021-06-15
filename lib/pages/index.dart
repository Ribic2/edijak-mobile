import 'dart:collection';

import 'package:edijak_mobile/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:edijak_mobile/components/navigationdrawer.dart';
import 'package:edijak_mobile/components/bar.dart';
import 'package:edijak_mobile/pages/Schedule/scheduleHeader.dart';
import 'package:edijak_mobile/pages/Schedule/scheduleRow.dart';

// Packages
import 'dart:convert';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class Index extends StatefulWidget {
  @override
  IndexClass createState() => IndexClass();
}

class IndexClass extends State<Index> {
  List data;
  var user;

  Future<String> getData() async {
    Response response = await get(
      'http://nsa.edijak.si/api/student/33/schedule',
    );

    this.setState(() {
      this.user = storage.getItem('user');
      var resData = jsonDecode(response.body);
      data = resData["Schedule"];
    });

    return "Works";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(
        title: Text("Edijak"),
        appBar: AppBar(),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScheduleHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: data == null ? null : data.length,
                itemBuilder: (context, i) {
                  return ScheduleRow(data: data[i]);
                },
              ),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}

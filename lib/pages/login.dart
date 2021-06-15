import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:edijak_mobile/pages/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class Login extends StatefulWidget {
  @override
  LoginForm createState() => LoginForm();
}

final LocalStorage storage = new LocalStorage('token');

class LoginForm extends State<Login> {


  @override
  void initState() {
    super.initState();
  }


  final email = TextEditingController();
  final password = TextEditingController();

  /// Sends request to log in user
  Future<void> login() async {
    // Try catch, if there was an error, it throws error else it redirects user
    // To specific route
    try {
      Response<Map> response = await Dio().post(
          'http://nsa.edijak.si/api/user/login',
          data: {'email': this.email.text, 'password': this.password.text});

      Map responseBody = response.data;
      storage.setItem('token', responseBody["token"]);
      storage.setItem('user', responseBody["user"]);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Index()),
        ModalRoute.withName('/webapp'),
      );

    } on DioError catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 300,
        child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Card(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text("Prijavi se",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40)),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              hintText: 'Vnesi uporabniško ime..'),
                        ),
                        TextFormField(
                          controller: password,
                          decoration:
                              InputDecoration(hintText: 'Vnesi geslo..'),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text(
                              "Prijavi se",
                            ),
                            onPressed: () {
                              login();
                            },
                          ),
                        )
                      ],
                    )))),
      )),
    );
  }
}

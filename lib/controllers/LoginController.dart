import 'package:edijak_mobile/pages/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class LoginController{
  String email;
  String password;
  final LocalStorage storage = new LocalStorage('some_key');

  Future<void> login() async {
    try {
      Response<Map> response = await Dio().post(
          'http://nsa.edijak.si/api/user/login',
          data: {'email': this.email, 'password': this.password});

      Map responseBody = response.data;
      storage.setItem('token', responseBody["token"]);
      storage.setItem('user', responseBody["user"]);

      BuildContext context;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Index()),
        ModalRoute.withName('/webapp'),
      );
    } on DioError catch (e) {
      print(e);
    }
  }


}
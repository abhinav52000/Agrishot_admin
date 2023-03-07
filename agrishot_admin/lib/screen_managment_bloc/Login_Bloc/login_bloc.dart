import 'dart:async';
import 'dart:convert';
import 'package:agrishot_admin/Network/Login_api/login_api_call.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _loginEmail = BehaviorSubject<String>();
  final _loginPassword = BehaviorSubject<String>();

  //Getters
  Stream<String> get loginEmail => _loginEmail.stream;
  Stream<String> get loginPassword => _loginPassword.stream;

  Stream<bool> get isValid =>
      Rx.combineLatest2(loginEmail, loginPassword, (loginEmail, pass) => true);

  //Setters
  Function(String) get changeloginEmail => _loginEmail.sink.add;
  Function(String) get changeLoginPassword => _loginPassword.sink.add;

  submit(BuildContext context) async {
    var response =
        await login(email: _loginEmail.value, password: _loginPassword.value);
    response = jsonDecode(response.body);
    return response;
  }

  //Dispose
  void dispose() {
    _loginEmail.close();
    _loginPassword.close();
  }
}

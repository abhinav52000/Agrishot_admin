import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api_list.dart';

login({String email = "", String password = ""}) async {
  try {
    var loginUrl = Uri.parse(baseUrl + loginPath);

    Map<String, dynamic> body = {
      "authType": "email",
      "password": password,
      "email": email
    };
    // String bodyJson = ;
    var response = await http.post(
      loginUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(body),
    );
    print(jsonDecode(response.body).toString());

    return response;
  } catch (e) {
    debugPrint(e.toString());
  }
}

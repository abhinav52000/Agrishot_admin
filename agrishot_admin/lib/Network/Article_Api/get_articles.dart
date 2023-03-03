import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api_list.dart';

getArticles({required String accessToken, required int pageNumber}) async {
  try {
    // print('I recieved token $accessToken');
    var loginUrl = Uri.parse(baseUrl + articlePath(pageNumber));

    var response = await http.get(
      loginUrl,
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    // print(jsonDecode(response.body).toString());
    return response;
  } catch (e) {
    debugPrint(e.toString());
  }
}

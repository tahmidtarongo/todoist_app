import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../const.dart';

Future<void> getTokenRepo() async {
  const String url = "https://todoist.com/oauth/access_token";
  final response = await http.post(Uri.parse(url), body: {
    "client_id": clintId,
    "client_secret": clientSecret,
    "code": code,
  });
  if (response.statusCode == 200) {

    final data = jsonDecode(response.body);
    print(data["access_token"]);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', data["access_token"]);
  } else {
    EasyLoading.showError("Error");
  }
}

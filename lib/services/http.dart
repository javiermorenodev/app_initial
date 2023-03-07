import 'dart:convert';

import 'package:first/models/models.dart';

import 'package:http/http.dart' as http;

class HttpService {
  static String _url = '';
  static String _token = '';

  HttpService() {
    _url = 'https://gorest.co.in/public/v2/';
    _token = '18ff4dfcee2d46f164b0fc1895d53f83d828fc208e9948caef0d7007af7bae21';
  }

  Future<List<UserModel>> getAllUsers() async {
    final resp = await http.get(
      Uri.parse('$_url/users'),
      headers: {'Authorization': 'Bearer $_token'},
    );

    return (jsonDecode(resp.body) as List)
        .map((user) => UserModel.fromJson(user))
        .toList();
  }
}

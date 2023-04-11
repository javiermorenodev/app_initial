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

  Future<bool> postUser(UserModel userModel) async {
    try {
      await http.post(
        Uri.parse('$_url/users'),
        body: userModel.toJson(),
        headers: {'Authorization': 'Bearer $_token'},
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<List<PostModel>> getAllPostByUser(int userId) async {
    final resp = await http.get(
      Uri.parse('$_url/users/$userId/posts'),
      headers: {'Authorization': 'Bearer $_token'},
    );

    return (jsonDecode(resp.body) as List)
        .map((user) => PostModel.fromJson(user))
        .toList();
  }

  Future<bool> postPost(PostModel postModel) async {
    try {
      await http.post(
        Uri.parse('$_url/users/${postModel.userId}/posts'),
        body: postModel.toJson(),
        headers: {'Authorization': 'Bearer $_token'},
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteUser(int userId) async {
    try {
      await http.delete(
        Uri.parse('$_url/users/$userId'),
        headers: {'Authorization': 'Bearer $_token'},
      );

      return true;
    } catch (error) {
      return false;
    }
  }
}

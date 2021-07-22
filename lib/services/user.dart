import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/models/user.dart';
import 'package:todo/services/auth.dart';

import '../constants/config.dart';

class UserService {
  Future<UserModel> login(String email, String password) async {
    const String url = '${API_URL}/login';
    final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      })
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['data'];
      final user = body['user'];
      return UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        token: body['token']
      );
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future<UserModel> register(String name, String email, String password) async {
    const String url = '${API_URL}/register';
    final response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'name': name,
        'password': password
      })
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['data'];
      final user = body['user'];
      return UserModel(
        id: user['id'],
        name: user['name'],
        email: user['email'],
        token: body['token']
      );
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future<bool> logout() async {
    return await AuthService().saveToken("");
  }
}
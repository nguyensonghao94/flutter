import 'dart:async';
import 'package:todo/services/client.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/auth.dart';

class UserService {
  Future<UserModel> login(String email, String password) async {
    const String url = '/login';
    final http = Client().init();
    final response = await http.post(url, data: {
      "email": email,
      "password": password
    });
    final data = response.data['data'];
    final user = data['user'];
    return UserModel(
      id: user['id'],
      name: user['name'],
      email: user['email'],
      token: data['token']
    );
  }

  Future<UserModel> register(String name, String email, String password) async {
    const String url = '/register';
    final http = Client().init();
    final response = await http.post(url, data: {
      'email': email,
      'name': name,
      'password': password
    });
    final data = response.data['data'];
    final user = data['user'];
    return UserModel(
      id: user['id'],
      name: user['name'],
      email: user['email'],
      token: data['token']
    );
  }

  Future<bool> logout() async {
    return await AuthService().saveToken("");
  }
}
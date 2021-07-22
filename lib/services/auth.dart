import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/user.dart';

class AuthService {
  Future<bool> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("token", token);
  }

  Future<bool> isLogined() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    return token != null && token != "" ? true : false;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString("token");
    return token != null && token != "" ? token : "";
  }
}
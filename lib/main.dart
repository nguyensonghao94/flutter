import 'package:flutter/material.dart';

import 'containers/login/login.dart';
import 'containers/register/register.dart';
import 'containers/home/home.dart';
import 'containers/add/add.dart';
import 'containers/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/add': (context) => AddScreen()
      },
    );
  }
}
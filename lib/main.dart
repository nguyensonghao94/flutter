import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {        
        if (snapshot.hasData) {
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
            builder: EasyLoading.init(),
          );
        }

        return CircularProgressIndicator();
      }
    );
  }
}
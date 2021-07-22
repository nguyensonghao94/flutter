import 'package:flutter/material.dart';
import 'package:todo/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    AuthService().isLogined().then((isLogin) {
      if (isLogin) {
        Navigator.popAndPushNamed(context, '/home');
      } else {
        Navigator.popAndPushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
      body: Center(
        child: Text('Loadding...'),
      )
    );
  }
}
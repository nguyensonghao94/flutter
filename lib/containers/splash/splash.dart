import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:todo/services/auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.subscribeToTopic('all');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification?.body ?? "");
    });
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
      body: Center(
        child: Text('Loadding...', style: TextStyle(fontSize: 20)),
      )
    );
  }
}
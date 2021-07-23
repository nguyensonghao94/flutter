import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:todo/helpers/dialog.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/auth.dart';
import 'package:todo/services/user.dart';

import '../../helpers/validate.dart';
import '../../components/button/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginForm = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool isCalling = false;

  submit() async {
    if (_loginForm.currentState!.validate()) {
      setState(() {
        this.isCalling = true;
      });

      try {
        UserModel user = await UserService().login(_emailCtrl.text, _passwordCtrl.text);
        AuthService().saveToken(user.token);
        Navigator.popAndPushNamed(context, '/home');
      } catch (e) {        
        toast(e.toString());
      }

      setState(() {
        this.isCalling = false;
      });
    }
  }  

  loginFB() async {
    final LoginResult result = await FacebookAuth.instance.login();    
    if (result.status == LoginStatus.success) {      
      final AccessToken accessToken = result.accessToken!;
      toast("Login Facebook success.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            Form(
              key: _loginForm,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailCtrl,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email'
                      ),
                      validator: (value) => isEmail("Email", value)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password'
                      ),
                      validator: (value) => validatePassword("Password", value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                      title: 'Sign in',
                      isLoading: isCalling,
                      onPress: this.submit
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade700)
                          ),
                          onPressed: this.loginFB,
                          child: Row(
                            children: [                        
                              Container(
                                margin: EdgeInsets.only(right: 6),
                                child: Icon(Icons.facebook, color: Colors.white)
                              ),
                              Text("Login with Facebook", style: TextStyle(color: Colors.white, fontSize: 14))
                            ]
                          )
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12),
                          child: TextButton(                          
                            onPressed: () => Navigator.pushNamed(context, '/register'),
                            child: Text(
                              "Create new account",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline
                              ),
                            ) 
                          ),
                        )
                      ],
                    )
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
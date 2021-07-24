import 'package:flutter/material.dart';
import 'package:todo/constants/message.dart';
import 'package:todo/helpers/dialog.dart';
import 'package:todo/models/user.dart';
import 'package:todo/services/auth.dart';
import 'package:todo/services/user.dart';

import '../../helpers/validate.dart';
import '../../components/button/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCalling = false;
  final _registerForm = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  submit() async {
    if (_registerForm.currentState!.validate()) {
      setState(() {
        this.isCalling = true;
      });

      try {
        UserModel user = await UserService().register(_nameCtrl.text, _emailCtrl.text, _passwordCtrl.text);
        AuthService().saveToken(user.token);
        Navigator.popAndPushNamed(context, '/home');
        toast(MESSAGE['REGISTER_SUCCESS'].toString());
      } catch (e) {        
        toast(e.toString());        
      }

      setState(() {
        this.isCalling = false;
      });   
    }
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
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
                key: _registerForm,
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
                        controller: _nameCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Full name'
                        ),
                        validator: (value) => isRequired("Full name", value)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordCtrl,
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
                        title: 'Sign up',
                        isLoading: isCalling,
                        onPress: () => this.submit()
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Have an account. Sign in",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline
                            ),
                          ) 
                      )
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
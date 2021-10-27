import 'package:first_flutter_app/pages/Services/authentication_service.dart';
import 'package:first_flutter_app/pages/home.dart';
import 'package:first_flutter_app/pages/screens/sign_up.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:provider/provider.dart';

class LoginSignIn extends StatefulWidget {
  const LoginSignIn({Key? key}) : super(key: key);

  @override
  _LoginSignInState createState() => _LoginSignInState();
}

class _LoginSignInState extends State<LoginSignIn> {
  final formkeyLog = GlobalKey<FormState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  bool isloading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          elevation: 0,
        ),
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formkeyLog,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value.toString().trim();
                        },
                        validator: (value) =>
                            (value!.isEmpty) ? ' Please enter email' : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Password";
                          }
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUpPage()));
                      },
                      child: const Text(
                        'Create an account',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {
                          if (formkeyLog.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            context
                                .read<AuthenticationServices>()
                                .signIn(email.trim(), password.trim(), context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                            setState(() {
                              isloading = false;
                            });
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                )));
  }
}

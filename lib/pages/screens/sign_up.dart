import 'package:first_flutter_app/pages/Services/authentication_service.dart';
import 'package:first_flutter_app/pages/screens/sign_in.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  String email = '';
  String password = '';
  String name = '';
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
          elevation: 0,
        ),
        body: isloading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            name = value.toString().trim();
                          },
                          validator: (value) => (value!.isEmpty)
                              ? ' Please enter your name'
                              : null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'First And Last Name',
                          ),
                        )),
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
                            MaterialPageRoute(builder: (_) => LoginSignIn()));
                      },
                      child: const Text(
                        'Have an Account Already?',
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
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });
                            context
                                .read<AuthenticationServices>()
                                .signUp(email.trim(), password.trim(), context);
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

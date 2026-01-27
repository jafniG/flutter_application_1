import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/authentication_provider.dart';
import 'package:flutter_application_1/view/shop_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  bool isLogin = true;
  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthenticationProvider>();
    final authListener = context.watch<AuthenticationProvider>();
    return Scaffold(
      // appBar: AppBar(title: Text("Login"), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginFormKey,
          child: Column(
            mainAxisAlignment: .center,
            spacing: 20,
            children: [
              Image.network(
                height: 200,
                width: 200,
                "https://img.freepik.com/free-vector/user-verification-unauthorized-access-prevention-private-account-authentication-cyber-security-people-entering-login-password-safety-measures_335657-3530.jpg?t=st=1768460448~exp=1768464048~hmac=6160c369a8b99381a12b3f51b68b3c76e214449f59c7fc6f36377eccfeb5dae2",
              ),
              TextFormField(
                controller: emailTextController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required field";
                  }
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  final RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value.toString())) {
                    return "Enter a Valid Email Address";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email ID",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: passwordTextController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "required field";
                  }
                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = RegExp(pattern);

                  if (!regex.hasMatch(value.toString())) {
                    return 'Enter a Valid Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              RichText(
                text: TextSpan(
                  text: !isLogin
                      ? 'Already have an account'
                      : "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                      text: !isLogin ? ' Login' : ' Create account',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
              authListener.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(400, 12)),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.deepPurple,
                        ),
                      ),
                      onPressed: () async {
                        final isValid =
                            loginFormKey.currentState?.validate() ?? false;

                        if (isValid) {
                          if (isLogin) {
                            await authProvider.signinAccount(
                              email: emailTextController.text,
                              password: passwordTextController.text,
                            );
                            if (authListener.userCredential != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopPage(),
                                ),
                              );
                            }
                          } else {
                            await authProvider.createAccount(
                              email: emailTextController.text,
                              password: passwordTextController.text,
                            );
                            if (authListener.userCredential != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopPage(),
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: Text(
                        !isLogin ? "CREATE ACCOUNT" : "LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

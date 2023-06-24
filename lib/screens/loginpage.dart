// ignore_for_file: use_build_context_synchronously

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mike_cab/brand_colors.dart';
import 'package:mike_cab/screens/main_page.dart';
import 'package:mike_cab/screens/registration_page.dart';
import 'package:mike_cab/widgets/progress_dialogue.dart';
import 'package:mike_cab/widgets/taxi_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static const String id = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void showSnackBar(String title, BuildContext context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red.withOpacity(0.8),
      margin: EdgeInsets.all(3),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void login() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const ProgressDialog(
            status: 'Logging in',
          );
        });

    try {
      final user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        print(user); //save uset details to db
        DatabaseReference userRef =
            FirebaseDatabase.instance.ref().child('users/${user.uid}');
        userRef.once().then((DatabaseEvent event) => {
              if (event.snapshot.value != null)
                {
                  Navigator.pushNamedAndRemoveUntil(
                      context, MainPage.id, (route) => false)
                }
            });
        showSnackBar('Login successful', context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnackBar(e.code, context);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showSnackBar(e.code, context);
      }
    } catch (e) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                'assets/images/logo.png',
                alignment: Alignment.center,
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Sign In as a Rider',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Brand-Bold',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Brand-Bold',
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Brand-Bold',
                        ),
                        hintStyle: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TaxiButton(
                      title: 'LOGIN',
                      onPressed: () async {
                        var connectivityResult =
                            await Connectivity().checkConnectivity();
                        if (!emailController.text.contains('@')) {
                          showSnackBar('Enter a valid password', context);
                          return;
                        }

                        if (passwordController.text.length < 8) {
                          showSnackBar('Password musr be at least 8 characters',
                              context);
                          return;
                        }
                        if (connectivityResult != ConnectivityResult.mobile &&
                            connectivityResult != ConnectivityResult.wifi) {
                          showSnackBar('No internet', context);
                          return;
                        }
                        login();
                      },
                      color: BrandColors.colorGreen,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, RegistrationPage.id, (route) => false);
                      },
                      child: const Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Brand-Bold',
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

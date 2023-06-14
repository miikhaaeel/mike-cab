import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mike_cab/brand_colors.dart';
import 'package:mike_cab/screens/loginpage.dart';
import 'package:mike_cab/widgets/taxi_button.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  static const String id = 'register';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8),
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
                'Sign Up as a Rider',
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
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
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
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
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
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
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
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TaxiButton(
                      title: 'REGISTER',
                      onPressed: () {},
                      color: BrandColors.colorGreen,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.id, (route) => false);
                      },
                      child: const Text(
                        "Already have an account? Sign in",
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

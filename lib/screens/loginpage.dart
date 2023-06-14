import 'package:flutter/material.dart';
import 'package:mike_cab/brand_colors.dart';
import 'package:mike_cab/screens/registration_page.dart';
import 'package:mike_cab/widgets/taxi_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String id = 'login';

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
                      title: 'LOGIN',
                      onPressed: () {},
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

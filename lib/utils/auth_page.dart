import 'package:ace_spark_v1/pages/home.dart';
import 'package:ace_spark_v1/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        }),
      ),
    );
  }
}

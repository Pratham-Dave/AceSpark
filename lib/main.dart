import 'package:ace_spark_v1/home.dart';
import 'package:ace_spark_v1/login.dart';
import 'package:ace_spark_v1/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   // Future<FirebaseApp> _initializeFirebase() async {
//   //   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   //   return firebaseApp
//   // }

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   body: SingleChildScrollView(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: const <Widget>[LoginPage()],
//     //     ),
//     //   ),
//     // );
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

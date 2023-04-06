import 'package:ace_spark_v1/utils/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
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

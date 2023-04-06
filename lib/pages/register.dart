import 'package:ace_spark_v1/utils/auth.dart';
import 'package:ace_spark_v1/pages/login.dart';
import 'package:ace_spark_v1/utils/userLoginProcess.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/auth_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void signUserUp() {
    FireAuth();
  }

//   void signUserUp() async {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         });
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);

//       // await serCredential.user?.updateDisplayName(username);
//       // ignore: use_build_context_synchronously
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const LoginPage()));

//       Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print("No user found for that email");
//       }

//       if (e.code == 'wrong-password') {
//         print("Username or password is wrong");
//       }
//     }
//   }
// //
  void click() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ));
  }

  Widget signInGoogleButton() {
    return InkWell(
      // ignore: sort_child_properties_last
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5),
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            Image(
              image: AssetImage('assets/images/google.png'),
              height: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Sign in with google",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      // onTap: clickForGoogle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "AceSpark",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),

            // Heading
            const Text(
              "Register to our App",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 44.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 44.0,
            ),

            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              // obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Enter Email address",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.black,
                  )),
            ),

            TextField(
              controller: username,
              decoration: const InputDecoration(
                  hintText: "Enter Username",
                  prefixIcon: Icon(
                    Icons.person_outline_sharp,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 12.0,
            ),

            // 3. Set recovery mail
            TextField(
              controller: password,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 12.0,
            ),

            // 4. Enter Password
            TextField(
              controller: confirmPassword,
              // obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  hintText: "Enter Confirm Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  )),
            ),

            const SizedBox(
              height: 12.0,
            ),

            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: const Color(0xFF0069FE),
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: signUserUp,
                child: const Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            const Center(
              child: Text(
                "Or",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            signInGoogleButton(),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Text(
                  "Already a User?",
                  style: TextStyle(fontSize: 16),
                ),
                GestureDetector(
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.blue[600], fontSize: 16),
                  ),
                  onTap: click,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

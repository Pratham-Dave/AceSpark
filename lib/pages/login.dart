import 'package:ace_spark_v1/utils/auth_page.dart';
import 'package:ace_spark_v1/pages/home.dart';
import 'package:ace_spark_v1/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late User user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user found for that email");
      }

      if (e.code == 'wrong-password') {
        print("Username or password is wrong");
      }
    }
  }

  void click() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void toRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  void clickForGoogle() {
    AuthService().signInWithGoogle().then((user) => {
          // this.user = user!,
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()))
        });
  }

  // This is a widget to create the sign in with google button
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
      onTap: clickForGoogle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
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
              const Text(
                "Login to our App",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 44.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 44.0,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                // ignore: unnecessary_const
                decoration: const InputDecoration(
                    hintText: "User Email",
                    prefixIcon: Icon(Icons.mail, color: Colors.black)),
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "User Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Text(
                "Don't remember password?",
                style: TextStyle(color: Colors.blue),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: const Color(0xFF0069FE),
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  onPressed: signUserIn,
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              signInGoogleButton(),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                        color: Colors.blue[600],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  onTap: toRegister,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:ace_spark_v1/utils/auth_page.dart';
import 'package:ace_spark_v1/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  int selectedItem = 0;

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AuthPage()));
  }

  void homePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  void onTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedItem,
      //   onTap: onTapped,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           onPressed: homePage,
      //           icon: const Icon(Icons.home),
      //         ),
      //         label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(Icons.search),
      //           onPressed: () {},
      //         ),
      //         label: 'Search'),
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //           icon: const Icon(Icons.person),
      //           onPressed: () {},
      //         ),
      //         label: 'Profile'),
      //   ],
      // ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) / 2.7,
            color: Colors.blue[800],
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: const <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Text(
                      "AceSpark",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425__340.png"),
                  radius: 70,
                ),
                const Text(
                  "Pratham Dave",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "pratham@gmail.com",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  blurRadius: 8,
                )
              ],
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            width: 350,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 180,
                      ),
                      Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.grey[700],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey[700],
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Account Settings",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 128,
                      ),
                      Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.grey[700],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey[700],
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.file_copy,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Your Documents ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 128,
                      ),
                      Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.grey[700],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.security,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Security ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 195,
                      ),
                      Transform(
                          transform: Matrix4.rotationY(math.pi),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.grey[700],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.black,
                    endIndent: 30,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: signOut,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.logout,
                          color: Colors.grey[700],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Sign Out ",
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 195,
                        ),
                        Transform(
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Colors.grey[700],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

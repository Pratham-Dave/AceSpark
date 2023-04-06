import 'package:ace_spark_v1/pages/profile.dart';
import 'package:ace_spark_v1/pages/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import 'documentslist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  final drivingLicense = TextEditingController();

  final currentDay = DateFormat("dd MMMM, yyyy").format(DateTime.now());

  void navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  void profileNavigation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  }

  void dialogBox() {
    print("Inside the function");
    Widget okButton = TextButton(onPressed: () {}, child: const Text("OK"));
    AlertDialog(
      content: Text(
          "Your driving license is being fetched with DL number ${drivingLicense.text}"),
      actions: [okButton],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Colors.blue[800],
          unselectedItemColor: Colors.blue[800]?.withOpacity(.60),
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.radar_rounded),
                  onPressed: () {},
                ),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: IconButton(
                  icon: const Icon(Icons.people),
                  onPressed: profileNavigation,
                ),
                label: 'Profile'),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi ${user.email!}!",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              currentDay,
                              style: TextStyle(
                                  color: Colors.blue[200], fontSize: 16),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Expanded(
                                  child: Dialog(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/empty.png'),
                                          height: 150,
                                        ),
                                        Text(
                                          "No new notifications to show",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  color: Colors.grey[200],
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Documents",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.more_horiz)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // List of all the documents

                        Expanded(
                            child: ListView(
                                // ignore: prefer_const_constructors
                                children: const [
                              DocumentTile(
                                text: "Driving License",
                                description: "Document to drive in India",
                                colorOption: Colors.orange,
                                icon: Icon(
                                  Icons.file_copy,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              DocumentTile(
                                text: "Insurance Papers",
                                description: "This is your insurance",
                                colorOption: Colors.green,
                                icon: Icon(
                                  Icons.security,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20),
                              // DocumentTile(),
                              // SizedBox(height: 20),
                              // DocumentTile(),
                              // SizedBox(height: 20),
                              // DocumentTile(),
                              // SizedBox(height: 20)
                            ])),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

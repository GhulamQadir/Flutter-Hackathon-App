// @dart=2.9
// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterhackathon/screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName;
  String email;
  String image;
  // String phoneNo;

  currentUserProfile() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()['userName'];
        email = ds.data()['email'];
        image = ds.data()['image'];
      }).catchError((e) {
        print(e);
      });
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  signOut() async {
    await auth.signOut();
    await googleSignIn.disconnect();

    Navigator.of(context).pushNamed("/sign-up");
  }

  goToHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  void viewImage() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: closeDialog,
            child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                  ),
                )),
          );
        });
  }

  logOut() async {
    await auth.signOut();
    googleSignIn.disconnect();
    setState(() {});
    print("user diconnected");

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }

  void logOutDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.purple,
                  ),
                  Text(
                    "  Log Out",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Are you sure you want to logout from your account?"),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: closeDialog,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  TextButton(
                    onPressed: logOut,
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "LogOut",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                "Account Details",
                style: TextStyle(color: Colors.black),
              )),
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: goToHome,
              ),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    onPressed: logOutDialog),
              ],
            ),
            body: FutureBuilder(
                future: currentUserProfile(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return Text("Loading please wait ");

                  return SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 8),
                        child: Column(children: [
                          Center(
                            child: Container(
                              child: GestureDetector(
                                onTap: viewImage,
                                child: CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(image ?? ''),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              "Name: $userName",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Email: ",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Text(
                                  email,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ])),
                  );
                })));
  }
}

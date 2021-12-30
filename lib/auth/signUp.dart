// @dart=2.9
// ignore_for_file: file_names, prefer_const_constructors, avoid_print, unnecessary_null_comparison, dead_code, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterhackathon/screens/home.dart';
import 'package:flutterhackathon/screens/loading_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  String imagePath;

  bool loading = false;

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagePath = image.path;
    });
    print(imagePath);
  }

  signUp() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    setState(() {
      loading = true;
    });

    try {
      final String userName = userNameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
      final String phoneNo = phoneNoController.text;
      final String imageName = path.basename(imagePath);

      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref('/$imageName');

      File file = File(imagePath);
      await ref.putFile(file);

      final UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      String downloadUrl = await ref.getDownloadURL();

      await db.collection("users").doc(user.user.uid).set({
        "userName": userName,
        "email": email,
        "phoneNo": phoneNo,
        "image": downloadUrl,
      });

      userNameController.clear();
      emailController.clear();
      phoneNoController.clear();
      passwordController.clear();

      print("Your registration has been completed !");

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
      EasyLoading.showSuccess('Your are Successfully Registered!');
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Center(child: Text("Sign Up")),
                backgroundColor: Colors.purple[500],
              ),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          height: 130,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: imagePath == null
                                ? NetworkImage(
                                    "https://www.shareicon.net/data/512x512/2015/09/28/647719_camera_512x512.png")
                                : FileImage(File(imagePath)),
                          )),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextFormField(
                          controller: userNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else if (value.length < 3) {
                              return "Your name is too short";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isNotEmpty && value.length > 7) {
                              return null;
                            } else if (value.length < 7 && value.isNotEmpty) {
                              return "Your email address is too short";
                            } else {
                              return "Please enter your email address";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "Your password is too short";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextFormField(
                          controller: phoneNoController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your phone number";
                            } else if (value.length < 11 && value.isNotEmpty) {
                              return "Enter atleast 11 characters";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Phone No",
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 150,
                          child: TextButton(
                              onPressed: signUp,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.purple[500]),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  )))),
                    ],
                  ),
                ),
              ),
            ));
  }
}

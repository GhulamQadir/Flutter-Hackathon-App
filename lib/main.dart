// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/auth/SignUp.dart';
import 'package:flutterhackathon/categories/cars.dart';
import 'package:flutterhackathon/categories/clothes.dart';
import 'package:flutterhackathon/categories/electronics.dart';
import 'package:flutterhackathon/categories/grocery.dart';
import 'package:flutterhackathon/categories/mobiles.dart';
import 'package:flutterhackathon/screens/cart.dart';
import 'package:flutterhackathon/screens/favorites.dart';
import 'package:flutterhackathon/screens/home.dart';
import 'package:flutterhackathon/screens/loading_screen.dart';
import 'package:flutterhackathon/screens/user_profile.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'auth/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  HttpOverrides.global = MyHttpOverrides();

  // configLoading();
}

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.dark
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.yellow
//     ..backgroundColor = Colors.green
//     ..indicatorColor = Colors.yellow
//     ..textColor = Colors.yellow
//     ..maskColor = Colors.blue.withOpacity(0.5)
//     ..userInteractions = true
//     ..dismissOnTap = false;
// }

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child:
                Text("Something went wrong!", textDirection: TextDirection.ltr),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
            // builder: EasyLoading.init(),
            routes: {
              "/home": (context) => Home(),
              "/sign-up": (context) => SignUp(),
              "/login": (context) => Login(),
              "/loading-screen": (context) => LoadingScreen(),
              "/user-profile": (context) => UserProfile(),
              "/electronics": (context) => Electronics(),
              "/cart-screen": (context) => CartScreen(),
              "/favorites-screen": (context) => FavoritesScreen(),
              "/cars": (context) => Cars(),
              "/mobiles": (context) => Mobiles(),
              "/clothes": (context) => Clothes(),
              "/grocery": (context) => Grocery(),
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
            child: Text("Loading...", textDirection: TextDirection.ltr));
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

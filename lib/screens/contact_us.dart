// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/categories/cars.dart';
import 'package:flutterhackathon/categories/clothes.dart';
import 'package:flutterhackathon/categories/electronics.dart';
import 'package:flutterhackathon/categories/grocery.dart';
import 'package:flutterhackathon/categories/mobiles.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cart.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var number = 03111122222;

  goToFavorites() {
    Navigator.of(context).pushNamed("/favorites-screen");
  }

  goToCart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CartScreen()));
  }

  // categories functions
  goToElectronics() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Electronics()));
  }

  goToCars() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cars()));
  }

  goToMobiles() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mobiles()));
  }

  goToClothes() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Clothes()));
  }

  goToGrocery() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Grocery()));
  }

  goToContactUs() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactUs()));
  }

  goToLoginScreen() {
    Navigator.of(context).pushNamed("/login");
  }

  goToProfileScreen() {
    Navigator.of(context).pushNamed("/user-profile");
  }

  goToHome() {
    Navigator.of(context).pushNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Contact Us",
              style: TextStyle(color: Colors.black),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          shadowColor: Colors.purple,
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[200],
          ),
          child: Drawer(
              child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Container(
                    height: 35,
                    width: 140,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Shopify",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: goToHome,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.home, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: FirebaseAuth.instance.currentUser == null
                        ? goToLoginScreen
                        : goToCart,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5, left: 10),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: FirebaseAuth.instance.currentUser == null
                        ? goToLoginScreen
                        : goToFavorites,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5, left: 10),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.favorite, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Favorites",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: goToContactUs,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5, left: 10),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(Icons.call, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Contact Us",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: FirebaseAuth.instance.currentUser == null
                        ? goToLoginScreen
                        : goToProfileScreen,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5, left: 10),
                          child: FirebaseAuth.instance.currentUser == null
                              ? Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.person, color: Colors.grey),
                                    SizedBox(width: 20),
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              : Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(Icons.person, color: Colors.grey),
                                    SizedBox(width: 20),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                        )),
                  ),
                ),
              ],
            ),
          )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                    onTap: () {
                      launch('tel://$number');
                    },
                    child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.purple,
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                          size: 40,
                        ))),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Call",
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 40,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                "shoppingcart@gmail.com",
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 40,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                "Street 14, block#8, Karachi, Pakistan",
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
              SizedBox(
                height: 40,
              ),
              CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.headphones,
                    color: Colors.white,
                    size: 40,
                  )),
              SizedBox(
                height: 8,
              ),
              Text(
                "24/7 Support",
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

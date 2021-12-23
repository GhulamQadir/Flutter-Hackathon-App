// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/screens/cart.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlaceOrder extends StatefulWidget {
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String location = "Null, press button";
  String address = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(
        position.latitude, position.longitude,
        localeIdentifier: 'en');
    print(placeMark);

    // Placemark place = placeMark;
    // print(place);

    address =
        "${placeMark[0].street}, ${placeMark[2].street}, ${placeMark[1].locality}, ${placeMark[2].country}";
    // ${placeMark[0].subLocality}, ${placeMark[0].locality}, ${placeMark[0].postalCode}, ${placeMark[0].country}"

    setState(() {});
  }

  placeOrder() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String name = nameController.text;
      final String email = emailController.text;
      final String phoneNo = phoneNoController.text;
      final String address = addressController.text;

      await db
          .collection("orders")
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection("currentUserOrder")
          .doc("user's details")
          .set({
        "name ": name,
        "email ": email,
        "phone No ": phoneNo,
        "address ": address,
      });
    } catch (e) {
      print(e.toString());
    }
    FirebaseFirestore db = FirebaseFirestore.instance;
    final String name = nameController.text;
    final String email = emailController.text;
    final String phoneNo = phoneNoController.text;
    final String address = addressController.text;

    await db
        .collection("orders")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("currentUserOrder")
        .doc("user's details")
        .set({
      "name ": name,
      "email ": email,
      "phone No ": phoneNo,
      "address ": address,
    });

    print("order placed!! congrats");

    var snackBar = SnackBar(content: Text('Your order has been placed'));
    ScaffoldMessenger.of(_formKey.currentContext).showSnackBar(snackBar);
  }
  // }

  goBack() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Order details")),
            leading:
                IconButton(onPressed: goBack, icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.purple[400],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.purple[500],
                          size: 140,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 20, right: 20),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 20,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            } else if (value.length < 3) {
                              return "Your name is too short";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Full name",
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
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
                          maxLength: 50,
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
                              Icons.email,
                              color: Colors.purple[500],
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
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
                          maxLength: 11,
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
                              borderRadius: BorderRadius.circular(12),
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
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          maxLength: 150,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your address";
                            } else if (value.length < 15 && value.isNotEmpty) {
                              return "Your address is may be incomplete";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Address (pick or type)",
                            prefixIcon: GestureDetector(
                              onTap: () async {
                                Position position = await _determinePosition();
                                // print(position.latitude);

                                // location =
                                //     "Lat: ${position.latitude}, Long: ${position.longitude}";

                                getAddressFromLatLong(position);

                                setState(() {});

                                addressController.value = addressController
                                    .value
                                    .copyWith(text: address);
                              },
                              child: Icon(
                                Icons.location_on,
                                color: Colors.purple[500],
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      // Text(
                      //   "Coordinate points",
                      //   style:
                      //       TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10, bottom: 30),
                      //   child: Text(
                      //     location,
                      //     style: TextStyle(fontSize: 18),
                      //   ),
                      // ),
                      // Text(
                      //   "Address",
                      //   style:
                      //       TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      // ),
                      // Padding(
                      //     padding: const EdgeInsets.only(top: 10, bottom: 10),
                      //     child: Text(address)),
                      // ElevatedButton(
                      //     onPressed: () async {
                      //       Position position = await _determinePosition();
                      //       print(position.latitude);

                      //       location =
                      //           "Lat: ${position.latitude}, Long: ${position.longitude}";

                      //       getAddressFromLatLong(position);

                      //       setState(() {});

                      //       addressController.value =
                      //           addressController.value.copyWith(text: address);
                      //     },
                      //     child: Text("Pick current location")),
                      // ElevatedButton(
                      //     onPressed: placeOrder, child: Text("Place order"))
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton.icon(
                            onPressed: placeOrder,
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Order Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, annotate_overrides, avoid_print, unused_element, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final firebaseUser = FirebaseAuth.instance.currentUser;

  goToHome() {
    Navigator.of(context).pushNamed("/home");
  }

  goBack() {
    Navigator.of(context).pushNamed("/favorites-screen");
  }

  Stream postStream;

  void initState() {
    postStream = FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("favorites")
        .snapshots();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Row(
              children: [
                Text(
                  "Favorites",
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 20,
                )
              ],
            )),
            leading: IconButton(
              onPressed: goToHome,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Container(
                child: StreamBuilder<QuerySnapshot>(
              stream: postStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }
                if (snapshot.data == null) {
                  return CircularProgressIndicator();
                }

                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    Map data = document.data();
                    String id = document.id;
                    data["id"] = id;

                    removeFromFavorites() async {
                      final firebaseUser = FirebaseAuth.instance.currentUser;
                      FirebaseFirestore db = FirebaseFirestore.instance;

                      await db
                          .collection("users")
                          .doc(firebaseUser.uid)
                          .collection("favorites")
                          .doc(data["id"])
                          .delete();

                      Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Color(0xfff2f5f3),
                          content: Text(
                            "Removed From Favorites",
                            style: TextStyle(color: Colors.black),
                          )));

                      print("removed from your favorites");
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: OpenContainer(
                                transitionDuration: Duration(seconds: 1),
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
                                closedBuilder: (context, action) {
                                  return Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 10),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 180,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: data["image"] ==
                                                                  null
                                                              ? NetworkImage(
                                                                  "https://www.northampton.ac.uk/wp-content/uploads/2018/11/default-svp_news.jpg")
                                                              : NetworkImage(data[
                                                                  "image"]))),
                                                ),
                                                Positioned(
                                                    top: 10,
                                                    left: 10,
                                                    child: GestureDetector(
                                                      onTap:
                                                          removeFromFavorites,
                                                      child: Icon(
                                                        Icons.delete,
                                                      ),
                                                    ))
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                alignment: Alignment.topLeft,
                                                child: ListTile(
                                                    title: Text(
                                                      data["name"],
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    subtitle: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3),
                                                      child: Text(
                                                        "${data["price"].toString()} PKR",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                    trailing: IconButton(
                                                        onPressed: () {
                                                          var name =
                                                              data["name"];
                                                          var image =
                                                              data["image"];
                                                          var price =
                                                              data["price"];
                                                          var color =
                                                              data["color"];
                                                          var details =
                                                              data["details"];
                                                          FirebaseFirestore db =
                                                              FirebaseFirestore
                                                                  .instance;
                                                          db
                                                              .collection(
                                                                  "users")
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  .uid)
                                                              .collection(
                                                                  "myCart")
                                                              .add({
                                                            "name": name,
                                                            "image": image,
                                                            "prize": price,
                                                            "color": color,
                                                            "details": details
                                                          });

                                                          Scaffold.of(context)
                                                              .showSnackBar(SnackBar(
                                                                  backgroundColor:
                                                                      Colors.purple[
                                                                          300],
                                                                  content: Text(
                                                                      "Added to your cart")));
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .shopping_cart_outlined,
                                                          color: Colors.black,
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                openBuilder: (context, action) {
                                  return SafeArea(
                                      child: SingleChildScrollView(
                                          child: Column(children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              height: 550,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: data["image"] ==
                                                              null
                                                          ? NetworkImage(
                                                              "https://www.northampton.ac.uk/wp-content/uploads/2018/11/default-svp_news.jpg",
                                                            )
                                                          : NetworkImage(
                                                              data["image"]))),
                                            )),
                                        Positioned(
                                          top: 9,
                                          left: 15,
                                          child: GestureDetector(
                                              onTap: goBack,
                                              child:
                                                  Icon(Icons.arrow_back_ios)),
                                        ),
                                        Positioned(
                                          top: 400,
                                          right: 15,
                                          left: 10,
                                          child: Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff2f2f2),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15)),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 15,
                                                  ),
                                                  child: ListTile(
                                                    title: Text(
                                                      data["name"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 15,
                                                  ),
                                                  child: Text(
                                                    "${data["price"]} PKR",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 13),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Color: ${data["color"]}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: Text(
                                                    data["details"],
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[600]),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Center(
                                                  child: Container(
                                                    width: 160,
                                                    child: TextButton(
                                                        onPressed: () async {
                                                          var name =
                                                              data["name"];
                                                          var image =
                                                              data["image"];
                                                          var price =
                                                              data["price"];
                                                          var color =
                                                              data["color"];
                                                          var details =
                                                              data["details"];
                                                          FirebaseFirestore db =
                                                              FirebaseFirestore
                                                                  .instance;
                                                          db
                                                              .collection(
                                                                  "users")
                                                              .doc(FirebaseAuth
                                                                  .instance
                                                                  .currentUser
                                                                  .uid)
                                                              .collection(
                                                                  "myCart")
                                                              .add({
                                                            "name": name,
                                                            "image": image,
                                                            "prize": price,
                                                            "color": color,
                                                            "details": details
                                                          });
                                                        },
                                                        child: Text(
                                                          "Add to Cart",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16),
                                                        ),
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Color(
                                                                            0xff696969)),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                            ))),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ])));
                                }),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            )),
          ),
        ));
  }
}

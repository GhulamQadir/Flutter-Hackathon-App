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
        home: Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: Center(
        child: Container(
            child: StreamBuilder<QuerySnapshot>(
          stream: postStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                    backgroundColor: Colors.purple[300],
                    content: Text("Removed From Favorites"),
                  ));

                  print("removed from your favorites");
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: OpenContainer(
                            transitionDuration: Duration(seconds: 1),
                            transitionType: ContainerTransitionType.fadeThrough,
                            closedBuilder: (context, action) {
                              return Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 250,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: data["image"] == null
                                                      ? NetworkImage(
                                                          "https://www.northampton.ac.uk/wp-content/uploads/2018/11/default-svp_news.jpg")
                                                      : NetworkImage(
                                                          data["image"]))),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            alignment: Alignment.topLeft,
                                            child: ListTile(
                                                title: Text(
                                                  data["name"],
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                trailing: GestureDetector(
                                                  onTap: removeFromFavorites,
                                                  child: Icon(
                                                    Icons.delete,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        Text(
                                          data["price"].toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
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
                                child: Column(
                                  children: [
                                    Container(
                                      height: 250,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: data["image"] == null
                                                  ? NetworkImage(
                                                      "https://www.northampton.ac.uk/wp-content/uploads/2018/11/default-svp_news.jpg",
                                                    )
                                                  : NetworkImage(
                                                      data["image"]))),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: ListTile(
                                        title: Text(
                                          data["name"] ?? '',
                                          style: TextStyle(
                                              fontSize: 15, color: Colors.red),
                                        ),
                                        subtitle: Text(
                                          data["prize"] ?? '',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(data["details"])
                                  ],
                                ),
                              ));
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

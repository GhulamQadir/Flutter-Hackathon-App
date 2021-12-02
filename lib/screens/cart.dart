// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, annotate_overrides, avoid_print, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/screens/place_order.dart';
import 'package:flutterhackathon/screens/user_profile.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String name;
  String image;
  final firebaseUser = FirebaseAuth.instance.currentUser;

  Stream cartStream;

  void initState() {
    cartStream = FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("myCart")
        .snapshots();

    super.initState();
  }

  ok() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("My Cart")),
          backgroundColor: Colors.purple,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: getUserProducts,
        //   child: Text("place order"),
        // ),
        backgroundColor: Color(0xfff0f0f0),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Center(
          child: Container(
              child: Column(
            children: [
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: cartStream,
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
                    if (snapshot.data.docs.isEmpty) {
                      return Container(
                        child: Text(
                          "No items added yet",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      );
                    }

                    return ListView(
                      children:
                          snapshot.data.docs.map((DocumentSnapshot document) {
                        Map data = document.data();
                        String id = document.id;
                        data["id"] = id;

                        placeAnOrder() async {
                          try {
                            QuerySnapshot userData = await FirebaseFirestore
                                .instance
                                .collection("users")
                                .doc(firebaseUser.uid)
                                .collection("myCart")
                                .get();

                            for (var i = 0; i < userData.docs.length; i++) {
                              Map item = userData.docs[i].data();
                              String itemId = userData.docs[i].id;

                              await FirebaseFirestore.instance
                                  .collection("orders")
                                  .doc(FirebaseAuth.instance.currentUser.uid)
                                  .collection("currentUserOrder")
                                  .doc(itemId)
                                  .set({
                                "name": item["name"],
                                "prize": item["prize"]
                              });
                            }
                            userData.docs.forEach((element) {
                              // print(element.data()["name"]);
                            });
                            print("order place");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlaceOrder()),
                            );
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return AlertDialog(
                            //           content: Column(
                            //         children: [
                            //           Text(
                            //             "Your order has been placed",
                            //             style: TextStyle(
                            //                 fontSize: 20,
                            //                 fontWeight: FontWeight.w600),
                            //           ),
                            //           ElevatedButton(
                            //               onPressed: ok, child: Text("Ok"))
                            //         ],
                            //       ));
                            //     });

                          } catch (e) {
                            print(e.toString());
                          }
                        }

                        removeProduct() async {
                          final FirebaseUser =
                              FirebaseAuth.instance.currentUser;
                          FirebaseFirestore db = FirebaseFirestore.instance;

                          await db
                              .collection("users")
                              .doc(FirebaseUser.uid)
                              .collection("myCart")
                              .doc(data["id"])
                              .delete();
                        }

                        return SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(
                              height: 20,
                            ),
                            // ElevatedButton(
                            //     onPressed: placeAnOrder,
                            //     child: Text("Place order")),
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: 10,
                            //     ),
                            //     Container(
                            //       height: 50,
                            //       width: 60,
                            //       decoration: BoxDecoration(
                            //           image: DecorationImage(
                            //               image: NetworkImage(data["image"]))),
                            //     ),
                            //     SizedBox(
                            //       width: 30,
                            //     ),
                            //     Text(
                            //       data["name"],
                            //       style: TextStyle(
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.w400),
                            //     ),
                            //     SizedBox(
                            //       width: 30,
                            //     ),
                            //     Text(
                            //       data["prize"],
                            //       style: TextStyle(
                            //           fontSize: 17,
                            //           fontWeight: FontWeight.w400),
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     IconButton(
                            //       onPressed: removeProduct,
                            //       icon: Icon(
                            //         Icons.remove_circle_outline,
                            //         color: Colors.yellow[500],
                            //       ),
                            //     ),

                            //   ],
                            // ),
                            Stack(
                              children: [
                                Container(
                                  // height: MediaQuery.of(context).size.height,
                                  height: 100,
                                  width: 340,
                                  child: Card(
                                    margin: EdgeInsets.only(top: 5),
                                    elevation: 5,
                                    // color: Color(0xfff0f0f0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(20)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  top: 15,
                                  child: Container(
                                    height: 70,
                                    width: 110,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(data["image"]))),
                                  ),
                                ),
                                Positioned(
                                  top: 22,
                                  left: 130,
                                  child: Text(
                                    data["name"],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 11,
                                  left: 260,
                                  child: IconButton(
                                    onPressed: removeProduct,
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.purple[300],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 11,
                                  left: 295,
                                  child: IconButton(
                                    onPressed: placeAnOrder,
                                    icon: Icon(
                                      Icons.check_circle_outline_outlined,
                                      color: Colors.purple[300],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 50,
                                  left: 130,
                                  child: Text(
                                    data["prize"],
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 20,
                            // ),
                          ]),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          )),
        ),
        // floatingActionButton: FloatingActionButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed("/grocery");
        //     },
        //     child: Text("Buy now")),
      ),
    );
  }
}

class EasyLoading {}

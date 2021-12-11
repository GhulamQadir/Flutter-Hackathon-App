// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, annotate_overrides, avoid_print, avoid_function_literals_in_foreach_calls, sized_box_for_whitespace, must_call_super

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/screens/place_order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

  // ok() {
  //   Navigator.of(context).pop();
  // }

  //     Future getTotal() async {
  // int sum = 0;
  // FirebaseFirestore.instance.collection('Users/$userid/Cart').get().then(
  //   (querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       for (var i = 1; i < result.data()['price'].toString().length; i++) {
  //         sum = sum + result.data()['price'];
  //       }
  //     });
  //     print('total : $sum');
  //   },
  // );
  // }

  double sum = 0;
  double total = 0;

  Future getTotal() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .collection("myCart")
        .get()
        .then(
      (querySnapshot) {
        querySnapshot.docs.forEach((result) {
          querySnapshot.docs.forEach((result) {
            sum = sum + result.data()['price'];
          });
        });
        setState(() {
          total = sum;
        });

        print('total : $sum');
      },
    );
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
              TextButton(onPressed: getTotal, child: Text("Total")),
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: cartStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    var items = FirebaseFirestore.instance
                        .collection('users')
                        .doc(firebaseUser.uid)
                        .collection("myCart")
                        .get();
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
                            Stack(
                              children: [
                                Container(
                                  height: 100,
                                  width: 340,
                                  child: Card(
                                    margin: EdgeInsets.only(top: 5),
                                    elevation: 5,
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
                                    data["prize"].toString(),
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
                            Text("kahd")
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
      ),
    );
  }
}

class EasyLoading {}

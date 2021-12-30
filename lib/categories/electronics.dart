// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, avoid_print, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Electronics extends StatefulWidget {
  @override
  _ElectronicsState createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  var electronicsNames = [
    "Smart LED TV",
    "TCL LED TV",
    "Dawlance AC",
    "Haier Inverter",
    "Pak Fan",
    "Dimaond Fan",
    "Siemens Iron",
    "TexStyle Iron",
    "Honda Generator",
    "Juicer",
    "Sandwich Maker",
    "Microwave Oven",
  ];
  var electronicsImages = [
    "https://cf.shopee.ph/file/cb1db0c08a6b4ebfdfaa58221ce71c4a",
    "https://media.croma.com/image/upload/v1628667331/Croma%20Assets/Entertainment/Television/Images/241642_xsetkh.png",
    "https://images.priceoye.pk/dawlance-1-5-ton-enercon-30-series-inverter-ac-pakistan-priceoye-8clmc.jpg",
    "https://salmanelectronics.com/wp-content/uploads/2021/04/Product-Uploading-5.jpg",
    "https://lh3.googleusercontent.com/proxy/fa-h-KPBSiPmRHsztmXxIwtlIxVg0jKA47wKtghRhtxhJtz8cVt45moK3cHlif0TI-RXO6wlHIe47DZFxZXVEBvEp8OQF500jbSZoxWSKNAPz8BjN2764vscB6A",
    "https://ezmakaan.com/wp-content/uploads/2020/02/1_11_1.png",
    "https://radiotvcentre.pk/wp-content/uploads/2020/01/TB23330GB-Siemens-Steam-Iron.jpg",
    "https://dam.braunhousehold.com/903x677/assets/156177",
    "https://static-01.daraz.pk/p/e90089770be20de2c6b3fc9213ef6d16.jpg",
    "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1635433073-breville-best-juicers-ghi-1635433036.png",
    "https://www.ubuy.com.tr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODEtWWhZcm8yY0wuX0FDX1NMMTUwMF8uanBn.jpg",
    "https://static-01.daraz.pk/p/5bdd03d6425ac0ae86b83c1b08c9b222.jpg",
  ];

  var electronicsColors = [
    // Colors.black,
    // Colors.black,
    // Color(0xffFF5733),
    // Colors.white,
    // Color(0xffF8F0E3),
    // Colors.white,
    // Color(0xffadd8e6),
    // Colors.grey,
    // Colors.black,
    // Color(0xff696969),
    // Colors.black,
    // Colors.black,

    "Black",
    "Black",
    "Light Brown",
    "White",
    "Off White",
    "White",
    "Light Blue",
    "Grey",
    "Black",
    "Shaded Grey",
    "Black",
    "Black",
  ];

  var details = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ];

  var electronicsPrizes = [
    53000,
    29400,
    84500,
    60000,
    15000,
    13000,
    6000,
    8000,
    52000,
    7000,
    3000,
    32000
  ];

  goToLoginScreen() {
    Navigator.of(context).pushNamed("/login");
  }

  goToCart() {
    Navigator.of(context).pushNamed("/cart-screen");
  }

  goToFavorites() {
    Navigator.of(context).pushNamed("/favorites-screen");
  }

  goToProfileScreen() {
    Navigator.of(context).pushNamed("/user-profile");
  }

  goToHome() {
    Navigator.of(context).pushNamed("/home");
  }

  final firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore db = FirebaseFirestore.instance;

  int length = 0;

  getLength() async {
    CollectionReference reference =
        db.collection('users').doc(firebaseUser.uid).collection("myCart");
    reference.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((change) {
        length = querySnapshot.docs.length;
        setState(() {
          length;
        });
      });
    });
  }

  void initState() {
    getLength();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Electronics"),
          backgroundColor: Colors.purple,
          actions: [
            GestureDetector(
                onTap: FirebaseAuth.instance.currentUser == null
                    ? goToLoginScreen
                    : goToFavorites,
                child: Icon(Icons.favorite)),
            GestureDetector(
                onTap: FirebaseAuth.instance.currentUser == null
                    ? goToLoginScreen
                    : goToCart,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Icon(Icons.shopping_cart),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 9, right: 20),
              child: Text(
                '$length',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.purple[300],
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
                        color: Colors.black,
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
                          child: Text(
                            "Home",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
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
                          child: Text(
                            "My Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
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
                          child: Text(
                            "Favorites",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
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
                              ? Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                              : Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                        )),
                  ),
                ),
              ],
            ),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 7,
                mainAxisSpacing: 15,
                childAspectRatio:
                    310 / (MediaQuery.of(context).size.height / 1.5),
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(electronicsPrizes.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: OpenContainer(
                            transitionDuration: Duration(seconds: 1),
                            transitionType: ContainerTransitionType.fadeThrough,
                            closedBuilder: (context, action) {
                              return Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 15,
                                        color: Colors.white,
                                        spreadRadius: 15)
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 260,
                                        ),
                                        Positioned(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 2),
                                            height: 180,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    electronicsImages[index]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              var name =
                                                  electronicsNames[index];
                                              var image =
                                                  electronicsImages[index];
                                              var prize =
                                                  electronicsPrizes[index];
                                              var color =
                                                  electronicsColors[index];
                                              var description = details[index];

                                              FirebaseFirestore db =
                                                  FirebaseFirestore.instance;

                                              FirebaseAuth.instance
                                                          .currentUser ==
                                                      null
                                                  ? goToLoginScreen()
                                                      .pushNamed("/login")
                                                  : db
                                                      .collection("users")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser.uid)
                                                      .collection("favorites")
                                                      .where("name",
                                                          isEqualTo: name)
                                                      .get()
                                                      .then((value) {
                                                      if (value
                                                          .docs.isNotEmpty) {
                                                        Scaffold.of(context)
                                                            .showSnackBar(SnackBar(
                                                                backgroundColor:
                                                                    Colors.purple[
                                                                        300],
                                                                content: Text(
                                                                    "Already added to favorites")));
                                                        print(
                                                            "Already added to favorites");
                                                      } else {
                                                        db
                                                            .collection("users")
                                                            .doc(FirebaseAuth
                                                                .instance
                                                                .currentUser
                                                                .uid)
                                                            .collection(
                                                                "favorites")
                                                            .add({
                                                          "name": name,
                                                          "image": image,
                                                          "price": prize,
                                                          "color": color,
                                                          "details": description
                                                        });

                                                        Scaffold.of(context)
                                                            .showSnackBar(SnackBar(
                                                                backgroundColor:
                                                                    Colors.purple[
                                                                        300],
                                                                content: Text(
                                                                    "Added to favorites")));
                                                        print(
                                                            "Added to favorites");
                                                      }
                                                    });
                                            },
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.grey,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 200,
                                          left: 5,
                                          child: Text(
                                            electronicsNames[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 235,
                                          child: Text(
                                            "${electronicsPrizes[index]} PKR",
                                            style: TextStyle(
                                                color: Color(0xff46eb78)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130,
                                          top: 232,
                                          child: GestureDetector(
                                              onTap: () async {
                                                var name =
                                                    electronicsNames[index];
                                                var image =
                                                    electronicsImages[index];
                                                var prize =
                                                    electronicsPrizes[index];
                                                var color =
                                                    electronicsColors[index];
                                                var description =
                                                    details[index];

                                                FirebaseFirestore db =
                                                    FirebaseFirestore.instance;

                                                FirebaseAuth.instance
                                                            .currentUser ==
                                                        null
                                                    ? goToLoginScreen()
                                                    : await db
                                                        .collection("users")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser
                                                            .uid)
                                                        .collection("myCart")
                                                        .add({
                                                        "name": name,
                                                        "image": image,
                                                        "prize": prize,
                                                        "color": color,
                                                        "details": description
                                                      });

                                                Scaffold.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Colors.purple[300],
                                                        content: Text(
                                                            "Added to your cart")));
                                              },
                                              child: Center(
                                                  child: Icon(
                                                Icons
                                                    .add_shopping_cart_outlined,
                                                color: Colors.purple,
                                              ))),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                  ],
                                ),
                              );
                            },
                            openBuilder: (context, action) {
                              return SafeArea(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                          Positioned(
                                              top: 0,
                                              left: 5,
                                              right: 5,
                                              child: Container(
                                                height: 550,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            electronicsImages[
                                                                index]))),
                                              )),
                                          Positioned(
                                            top: 400,
                                            right: 15,
                                            left: 10,
                                            child: Container(
                                              height: 300,
                                              decoration: BoxDecoration(
                                                color: Color(0xfff2f2f2),
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
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
                                                        electronicsNames[index],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          var name =
                                                              electronicsNames[
                                                                  index];
                                                          var image =
                                                              electronicsImages[
                                                                  index];
                                                          var prize =
                                                              electronicsPrizes[
                                                                  index];
                                                          var color =
                                                              electronicsColors[
                                                                  index];
                                                          var description =
                                                              details[index];

                                                          FirebaseFirestore db =
                                                              FirebaseFirestore
                                                                  .instance;

                                                          FirebaseAuth.instance
                                                                      .currentUser ==
                                                                  null
                                                              ? goToLoginScreen()
                                                                  .pushNamed(
                                                                      "/login")
                                                              : db
                                                                  .collection(
                                                                      "users")
                                                                  .doc(FirebaseAuth
                                                                      .instance
                                                                      .currentUser
                                                                      .uid)
                                                                  .collection(
                                                                      "favorites")
                                                                  .where("name",
                                                                      isEqualTo:
                                                                          name)
                                                                  .get()
                                                                  .then(
                                                                      (value) {
                                                                  if (value.docs
                                                                      .isNotEmpty) {
                                                                    Scaffold.of(context).showSnackBar(SnackBar(
                                                                        backgroundColor:
                                                                            Colors.purple[
                                                                                300],
                                                                        content:
                                                                            Text("Already added to favorites")));
                                                                    print(
                                                                        "Already added to favorites");
                                                                  } else {
                                                                    db
                                                                        .collection(
                                                                            "users")
                                                                        .doc(FirebaseAuth
                                                                            .instance
                                                                            .currentUser
                                                                            .uid)
                                                                        .collection(
                                                                            "favorites")
                                                                        .add({
                                                                      "name":
                                                                          name,
                                                                      "image":
                                                                          image,
                                                                      "price":
                                                                          prize,
                                                                      "color":
                                                                          color,
                                                                      "details":
                                                                          description
                                                                    });

                                                                    Scaffold.of(context).showSnackBar(SnackBar(
                                                                        backgroundColor:
                                                                            Colors.purple[
                                                                                300],
                                                                        content:
                                                                            Text("Added to favorites")));
                                                                    print(
                                                                        "Added to favorites");
                                                                  }
                                                                });
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color: Colors.grey,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 15,
                                                    ),
                                                    child: Text(
                                                      "${electronicsPrizes[index]} PKR",
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
                                                          "Color: ${electronicsColors[index]}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        // Container(
                                                        //   height: 19,
                                                        //   width: 20,
                                                        //   decoration:
                                                        //       BoxDecoration(
                                                        //     borderRadius:
                                                        //         BorderRadius
                                                        //             .circular(
                                                        //                 30),
                                                        //     color:
                                                        //         electronicsColors[
                                                        //             index],
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      details[index],
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
                                                                electronicsNames[
                                                                    index];
                                                            var image =
                                                                electronicsImages[
                                                                    index];
                                                            var prize =
                                                                electronicsPrizes[
                                                                    index];
                                                            var color =
                                                                electronicsColors[
                                                                    index];
                                                            var description =
                                                                details[index];

                                                            FirebaseFirestore
                                                                db =
                                                                FirebaseFirestore
                                                                    .instance;

                                                            FirebaseAuth.instance
                                                                        .currentUser ==
                                                                    null
                                                                ? goToLoginScreen()
                                                                : await db
                                                                    .collection(
                                                                        "users")
                                                                    .doc(FirebaseAuth
                                                                        .instance
                                                                        .currentUser
                                                                        .uid)
                                                                    .collection(
                                                                        "myCart")
                                                                    .add({
                                                                    "name":
                                                                        name,
                                                                    "image":
                                                                        image,
                                                                    "prize":
                                                                        prize,
                                                                    "color":
                                                                        color,
                                                                    "details":
                                                                        description
                                                                  });
                                                            EasyLoading.showSuccess(
                                                                'Added to your cart!');
                                                          },
                                                          child: Text(
                                                            "Add to Cart",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16),
                                                          ),
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  MaterialStateProperty.all<
                                                                          Color>(
                                                                      Color(
                                                                          0xff696969)),
                                                              shape: MaterialStateProperty
                                                                  .all<
                                                                      RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

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
    "https://lh3.googleusercontent.com/proxy/7KNlxB5xucsfnS0P0gJIY08Vi2HtevoYzJGjFqO2lQBK_K7NU5WGWU8dSg6oaA03yRolV8zXhy-us1inRTkt1V26b3al-8b5cRWLwjKv3E1RNPP27h_GZFSyzUU",
    "https://ezmakaan.com/wp-content/uploads/2020/02/1_11_1.png",
    "https://radiotvcentre.pk/wp-content/uploads/2020/01/TB23330GB-Siemens-Steam-Iron.jpg",
    "https://dam.braunhousehold.com/903x677/assets/156177",
    "https://static-01.daraz.pk/p/e90089770be20de2c6b3fc9213ef6d16.jpg",
    "https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1635433073-breville-best-juicers-ghi-1635433036.png",
    "https://www.ubuy.com.tr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODEtWWhZcm8yY0wuX0FDX1NMMTUwMF8uanBn.jpg",
    "https://static-01.daraz.pk/p/5bdd03d6425ac0ae86b83c1b08c9b222.jpg",
  ];

  var electronicsColors = [
    "Black",
    "Black",
    "Light brown",
    "White",
    "Off white",
    "White",
    "Light blue",
    "Grey",
    "Black",
    "Shaded grey",
    "Black",
    "Black",
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

  var describedName = [
    "A smart TV, also known as a connected TV (CTV), is a traditional television set with integrated Internet and interactive Web 2.0 features, which allows users to stream music and videos, browse the internet, and view photos. Smart TVs are a technological convergence of computers, televisions, and digital media players.",
    "TCL specializes in the research, development and the manufacturing of consumer electronics products ranging from TVs, mobile phones, white goods and smart home products.",
    "Dirt accumulates on the evaporator of the air conditioner during its operation, the dirty evaporator facilitates bacterial growth and affect the quality of air out and the health of our body, our patent Cold Expansion Technology freezes the surface with moisture in the air and removes the dirt in defrosting.",
    "Split AC is a blend of design, durability, and convenience. Elegant Glass Design, Low-Voltage Support, and High-Efficiency Compressor make this model a must-have.",
    "Pak Fan is a blend of design, durability, and convenience. Elegant Glass Design, Low-Voltage Support, and High-Efficiency Compressor make this model a must-have.",
    "Diamond Fan TCL specializes in the research, development and the manufacturing of consumer electronics products ranging from TVs, mobile phones, white goods and smart home products.",
    "Siemens Steam Iron is a blend of design, durability, and convenience. Elegant Glass Design, Low-Voltage Support, and High-Efficiency Compressor make this model a must-have.",
    "TexStyle Steam Iron is a blend of design, durability, and convenience. Elegant Glass Design, Low-Voltage Support, and High-Efficiency Compressor make this model a must-have.",
    "Honda Generator specializes in the research, development and the manufacturing of consumer electronics products ranging from TVs, mobile phones, white goods and smart home products.",
    "Juicer is a tool used to extract juice from fruits, herbs, leafy greens and other types of vegetables in a process called juicing.[1] It crushes, grinds, and/or squeezes the juice out of the pulp.",
    "Sandwich Maker specializes in the research, development and the manufacturing of consumer electronics products ranging from TVs, mobile phones, white goods and smart home products.",
    "Microwave ovens heat food using microwaves, a form of electromagnetic radiation similar to radio waves. Microwaves have three characteristics that allow them to be used in cooking: they are reflected by metal; they pass through glass, paper, plastic, and similar materials; and they are absorbed by foods."
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
                                              var fullName =
                                                  describedName[index];
                                              var color =
                                                  electronicsColors[index];

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
                                                          "fullName": fullName,
                                                          "color": color
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
                                              Icons.favorite,
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
                                                var fullName =
                                                    describedName[index];
                                                var color =
                                                    electronicsColors[index];

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
                                                        "fullName": fullName,
                                                        "color": color
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
                                      Image.network(
                                        electronicsImages[index],
                                        height: 250,
                                        width: 300,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(electronicsNames[index]),
                                          GestureDetector(
                                            onTap: () {
                                              var name =
                                                  electronicsNames[index];
                                              var image =
                                                  electronicsImages[index];
                                              var prize =
                                                  electronicsPrizes[index];
                                              var fullName =
                                                  describedName[index];
                                              var color =
                                                  electronicsColors[index];

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
                                                      .add({
                                                      "name": name,
                                                      "image": image,
                                                      "price": prize,
                                                      "fullName": fullName,
                                                      "color": color
                                                    });
                                            },
                                            child: Center(
                                              child: Icon(
                                                Icons.favorite,
                                                color: Colors.grey,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(describedName[index]),
                                      TextButton(
                                          onPressed: () async {
                                            var name = electronicsNames[index];
                                            var image =
                                                electronicsImages[index];
                                            var prize =
                                                electronicsPrizes[index];
                                            var fullName = describedName[index];
                                            var color =
                                                electronicsColors[index];

                                            FirebaseFirestore db =
                                                FirebaseFirestore.instance;

                                            FirebaseAuth.instance.currentUser ==
                                                    null
                                                ? goToLoginScreen()
                                                : await db
                                                    .collection("users")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser.uid)
                                                    .collection("myCart")
                                                    .add({
                                                    "name": name,
                                                    "image": image,
                                                    "prize": prize,
                                                    "fullName": fullName,
                                                    "color": color
                                                  });
                                            EasyLoading.showSuccess(
                                                'Added to your cart!');
                                          },
                                          child: Icon(
                                            Icons.add_shopping_cart_outlined,
                                            color: Colors.purple,
                                            size: 25,
                                          ))
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

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, avoid_print

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Mobiles extends StatefulWidget {
  @override
  _MobilesState createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  var mobileName = [
    "Samsung",
    "Nokia",
    "Infinix",
    "Iphone",
    "Iphone",
    "Realme",
  ];

  var mobileImage = [
    "http://www.albawaba.com/sites/default/files/styles/default/public/2021-08/Samsung%20Galaxy%20S21%20Ultra.jpg?itok=tHHiXwZ5",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvO0gcTNBVnIazH7VYaV3rEKP6z5WOen2i7A&usqp=CAU",
    "https://image01.realme.net/general/20210903/1630653379477.png",
    "https://image01.realme.net/general/20210903/1630653379477.png",
    "https://image01.realme.net/general/20210903/1630653379477.png",
  ];

  var mobilePrize = [
    "16000",
    "11000",
    "17000",
    "180000",
    "210000",
    "16000",
  ];

  var description = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel libero nisi. In at metus at risus tempor suscipit quis sed ex. Suspendisse risus ligula, gravida sed ipsum id, semper pretium erat. Nullam commodo risus purus, non tempor eros tempor non. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis leo nec leo mattis accumsan. Vivamus id sapien ut ligula luctus ornare."
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

  var increment = 0;

  cartAdded() {
    setState(() {
      increment++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Mobiles")),
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
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Icon(Icons.shopping_cart),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Text('$increment'),
            )
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
            Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  left: 5,
                  right: 5,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(mobilePrize.length, (index) {
                    return Center(
                      child: OpenContainer(
                          transitionDuration: Duration(seconds: 1),
                          transitionType: ContainerTransitionType.fadeThrough,
                          closedBuilder: (context, action) {
                            return Container(
                              child: Card(
                                elevation: 3,
                                color: Color(0xfff8f8ff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      height: 90,
                                      width: 160,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              NetworkImage(mobilePrize[index]),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 5),
                                          child: Text(
                                            mobileName[index],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            var name = mobileImage[index];
                                            var image = mobileImage[index];
                                            var prize = mobilePrize[index];
                                            var descrip = description[index];

                                            FirebaseFirestore db =
                                                FirebaseFirestore.instance;

                                            FirebaseAuth.instance.currentUser ==
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
                                                    "description": descrip
                                                  });
                                          },
                                          child: Center(
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.grey,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("${mobilePrize[index]} Rs"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        GestureDetector(
                                            onTap: () async {
                                              try {
                                                var name = mobileName[index];
                                                var image = mobileImage[index];
                                                var prize = mobilePrize[index];
                                                var descrip =
                                                    description[index];

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
                                                        "description": descrip
                                                      });
                                                cartAdded();
                                              } catch (e) {
                                                print(e);
                                              }
                                            },
                                            child: Center(
                                                child: Icon(
                                              Icons.add_shopping_cart_outlined,
                                              color: Colors.purple,
                                            )))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          openBuilder: (context, action) {
                            return SafeArea(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.network(
                                      mobileImage[index],
                                      height: 250,
                                      width: 300,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(mobileName[index]),
                                        GestureDetector(
                                          onTap: () {
                                            var name = mobileName[index];
                                            var image = mobileImage[index];
                                            var prize = mobilePrize[index];
                                            var descrip = description[index];

                                            FirebaseFirestore db =
                                                FirebaseFirestore.instance;

                                            FirebaseAuth.instance.currentUser ==
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
                                                    "description": descrip,
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
                                    Text(description[index]),
                                    TextButton(
                                        onPressed: () async {
                                          var name = mobileName[index];
                                          var image = mobileImage[index];
                                          var prize = mobilePrize[index];
                                          var descrip = description[index];

                                          FirebaseFirestore db =
                                              FirebaseFirestore.instance;

                                          FirebaseAuth.instance.currentUser ==
                                                  null
                                              ? goToLoginScreen()
                                              : await db
                                                  .collection("users")
                                                  .doc(FirebaseAuth
                                                      .instance.currentUser.uid)
                                                  .collection("myCart")
                                                  .add({
                                                  "name": name,
                                                  "image": image,
                                                  "prize": prize,
                                                  "description": descrip
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
                    );
                  }),
                ))
          ]),
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers

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
    "data:image/jpeg;base64,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",
    "https://image01.realme.net/general/20210903/1630653379477.png",
  ];

  var mobilePrize = [
    "16000",
    "11000",
    "18000",
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
                ))
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
                child: Expanded(
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
                                              var name = mobileName[index];
                                              var image = mobileImage[index];
                                              var prize = mobilePrize[index];
                                              var descrip = description[index];

                                              FirebaseFirestore db =
                                                  FirebaseFirestore.instance;

                                              FirebaseAuth.instance
                                                          .currentUser ==
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
                                                      "description": descrip
                                                    });
                                              EasyLoading.showSuccess(
                                                  'Added to your cart!');
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
                )))
          ]),
        ),
      ),
    );
  }
}

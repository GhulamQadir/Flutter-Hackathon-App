// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, avoid_print

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Clothes extends StatefulWidget {
  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  var clothesName = [
    "Shalwar Kameez",
    "Pant Shirt",
    "T-Shirt",
    "Coat Pant",
    "Kurta Pajama",
    "Formal Shirt",
  ];

  var clothesImage = [
    "https://cdn.shopify.com/s/files/1/0061/8944/9306/products/1_21dc147d-6a4a-49ce-a450-8c407a863165.jpg?v=1558597173",
    "https://i.pinimg.com/564x/e1/64/8d/e1648df93bbbbe3cf99298bacbcf5fb9.jpg",
    "https://i.pinimg.com/564x/e1/64/8d/e1648df93bbbbe3cf99298bacbcf5fb9.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSybYQQV1Nq_4AzGdP4cGC1v6fViQcMDCsSQQ&usqp=CAU",
    "https://cdn.shopify.com/s/files/1/0061/8944/9306/products/1_21dc147d-6a4a-49ce-a450-8c407a863165.jpg?v=1558597173",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc6y9FbC0Ufm09uNdLPZ8izqlR6icRzIhqpYgr3rKUpPc-uw3aogXGAXBf0TVOhnTKyL4&usqp=CAU",
  ];

  var clothesPrize = [
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
          title: Text("Clothes"),
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
            Text('$increment')
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
                  children: List.generate(clothesPrize.length, (index) {
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
                                              NetworkImage(clothesImage[index]),
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
                                            clothesName[index],
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
                                            var name = clothesName[index];
                                            var image = clothesImage[index];
                                            var prize = clothesPrize[index];
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
                                        Text("${clothesPrize[index]} Rs"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        GestureDetector(
                                            onTap: () async {
                                              var name = clothesName[index];
                                              var image = clothesImage[index];
                                              var prize = clothesPrize[index];
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

                                              print("Added to your cart");
                                              cartAdded();
                                              // });
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
                                      clothesImage[index],
                                      height: 250,
                                      width: 300,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(clothesName[index]),
                                        GestureDetector(
                                          onTap: () {
                                            var name = clothesName[index];
                                            var image = clothesImage[index];
                                            var prize = clothesPrize[index];
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
                                          var name = clothesName[index];
                                          var image = clothesImage[index];
                                          var prize = clothesPrize[index];
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

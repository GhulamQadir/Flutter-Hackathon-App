// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, avoid_print, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, deprecated_member_use

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
    "Horse Black T-Shirt",
    "Light blue T-Shirt",
    "Navy blue T-Shirt",
    "Light green T-Shirt",
    "Light brown T-Shirt",
    "Dark grey T-Shirt",
    "Green check Shirt",
    "Grey check Shirt",
    "Blue check Shirt",
    "Purple check Shirt",
    "Formal grey Shirt",
    "Formal blue Shirt",
  ];

  var clothesImage = [
    "https://i.pinimg.com/originals/5d/59/61/5d596161892d8f9ad6e07004d0cef2f9.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdgRAAj6WdCWjEFpDtfmBXDA3lywLfgFzprGkvy4aDOYfCUNKWKMbC1O5oXw3KMM75so4&usqp=CAU",
    "https://cdna.lystit.com/photos/countryhouseoutdoor/adc3d9b5/joules-Sea-Blue-Plain-Tee-Jersey-Mens-T-shirt-w.jpeg",
    "https://thatshirt.com/wp-content/uploads/2017/08/Bella-Canvas-3001-Jersey-T-shirt-Kelly-front.jpg",
    "https://cdn.shopify.com/s/files/1/1529/1475/products/mens-gildan-short-sleeve-heavy-cotton-tshirt-charcoal_grande.jpg?v=1575464160",
    "https://cdn11.bigcommerce.com/s-rxzabllq/images/stencil/1280x1280/products/1504/18042/1HT_Denim_Marle-Plain-100-Cotton-Tshirt-Online__03274.1567087781.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm--dTgGna1kp0epDRi1I5eo2v8Tfmgfiwgl7YFxcp4OfvZdVPInzqDtl4ydMm4vGPss8&usqp=CAU",
    "https://images.sportsdirect.com/images/products/55800181_l.jpg",
    "https://media.takealot.com/covers_images/1ac61daf490e4c73ac8d57cdd867b9cb/s-pdpxl.file",
    "https://the-collective.imgix.net/img/app/product/4/476757-3672742.jpg?w=610&auto=format",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-3DpU0I9Z9Y2Vj5owu3gaC3x2sZhRBIyAr6nfDDvE9aEfPnNo2Rl990p1fnHmJP0pvAk&usqp=CAU",
    "https://media.istockphoto.com/photos/mens-shirt-picture-id488160041?k=20&m=488160041&s=612x612&w=0&h=OH_-skyES8-aeTvDQHdVDZ6GKLsqp6adFJC8u6O6_UY=",
  ];

  var clothesPrize = [
    1000,
    1000,
    1000,
    1000,
    1000,
    1000,
    2100,
    2100,
    2100,
    2100,
    1800,
    1800,
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
        backgroundColor: Color(0xffededed),
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
                children: List.generate(clothesImage.length, (index) {
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
                                                    clothesImage[index]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: GestureDetector(
                                            onTap: () {
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
                                                          "description": descrip
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
                                          top: 215,
                                          left: 5,
                                          child: Text(
                                            clothesName[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 241,
                                          child: Text(
                                            "${clothesPrize[index]} PKR",
                                            style: TextStyle(
                                                color: Color(0xff46eb78)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130,
                                          top: 238,
                                          child: GestureDetector(
                                              onTap: () async {
                                                var name = clothesName[index];
                                                var image = clothesImage[index];
                                                var prize = clothesPrize[index];
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
                                    )
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

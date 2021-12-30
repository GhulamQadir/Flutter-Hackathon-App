// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, avoid_print, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Cars extends StatefulWidget {
  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  var carsNames = [
    "Honda Civic 2019",
    "Toyota Corolla 2018",
    "Honda City 2015",
    "Kia Sportage 2021",
    "Toyota Vitz 2014",
    "Toyota Corolla 2011",
    "Suzuki Alto 2017",
    "Suzuki Swift 2017",
    "Honda Civic 2020",
    "Haval 2021",
    "Toyota Cynos 1996",
    "Toyota Paseo 1992",
  ];
  var carsImages = [
    "https://i.ytimg.com/vi/GwowU444Ky8/maxresdefault.jpg",
    "https://i.ytimg.com/vi/C9KdHSq9rPw/maxresdefault.jpg",
    "https://stimg.cardekho.com/images/car-images/large/Honda/Honda-City/Golden-brown-metallic.jpg",
    "https://www.iihs.org/api/ratings/model-year-images/2928/636/",
    "https://www.batfa.com/photo-used-car-toyota-vitz-2014-silver.files/Vitz-2014-Silver-front.jpg",
    "https://images.hgmsites.net/lrg/2011-toyota-corolla-4-door-sedan-auto-s-natl-angular-front-exterior-view_100345830_l.jpg",
    "https://4.imimg.com/data4/TT/TT/GLADMIN-/src-cars-maruti-suzuki-alto-800-lx-500x500.jpg",
    "https://pictures.topspeed.com/IMG/crop/201612/2017-suzuki-swift-21_1600x0w.jpg",
    "https://autos.hamariweb.com/images/carimages/car_6916_777434.jpg",
    "https://cache1.pakwheels.com/system/car_generation_pictures/5481/original/dgrdh7wz0povzt5qrzqe.jpg?1619178326",
    "https://upload.wikimedia.org/wikipedia/commons/f/f6/Toyota_CYNOS_2nd.JPG",
    "https://consumerguide.com/wp-content/uploads/2014/07/92812111990510.jpg"
  ];

  var carsPrizes = [
    3200000,
    2500000,
    2100000,
    4650000,
    2000000,
    1200000,
    1900000,
    1500000,
    4150000,
    6495000,
    300000,
    200000
  ];

  var carsColors = [
    // Colors.white,
    // Colors.grey,
    // Colors.black,
    // Colors.red,
    // Color(0xffC0C0C0),
    // Colors.white,
    // Color(0xffA9A9A9),
    // Colors.white,
    // Colors.blue[900],
    // Colors.blue[400],
    // Colors.red,
    // Colors.red,

    "White",
    "Grey",
    "Black",
    "Red",
    "Silver",
    "White",
    "Dark Grey",
    "White",
    "Dark Blue",
    "Light Blue",
    "Red",
    "Red",
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
          title: Text("Cars"),
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
                children: List.generate(carsPrizes.length, (index) {
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
                                                    carsImages[index]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              var name = carsNames[index];
                                              var image = carsImages[index];
                                              var prize = carsPrizes[index];
                                              var colors = carsColors[index];
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
                                                          "color": colors,
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
                                            carsNames[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 235,
                                          child: Text(
                                            "${carsPrizes[index]} PKR",
                                            style: TextStyle(
                                                color: Color(0xff46eb78)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130,
                                          top: 232,
                                          child: GestureDetector(
                                              onTap: () async {
                                                var name = carsNames[index];
                                                var image = carsImages[index];
                                                var prize = carsPrizes[index];
                                                var colors = carsColors[index];
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
                                                        "color": colors,
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
                                                            carsImages[
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
                                                        carsNames[index],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          var name =
                                                              carsNames[index];
                                                          var image =
                                                              carsImages[index];
                                                          var prize =
                                                              carsPrizes[index];
                                                          var color =
                                                              carsColors[index];
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
                                                      "${carsPrizes[index]} PKR",
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
                                                          "Color: ${carsColors[index]}",
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
                                                        //     color: carsColors[
                                                        //         index],
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
                                                                carsNames[
                                                                    index];
                                                            var image =
                                                                carsImages[
                                                                    index];
                                                            var prize =
                                                                carsPrizes[
                                                                    index];
                                                            var color =
                                                                carsColors[
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

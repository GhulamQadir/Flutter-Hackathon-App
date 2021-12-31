// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, avoid_print, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, deprecated_member_use

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
    "Iphone X",
    "Iphone 12",
    "Asus Zenfone 5Z",
    "Asus Zenfone 8",
    "Oppo A93",
    "Oppo f19 Pro",
    "Infinix Smart 5",
    "Infinix S4",
    "Samsung Galaxy S21",
    "Samsung Galaxy S9",
    "Redmi Note 10",
    "Redmi Note 8",
  ];

  var mobilesColors = [
    // Colors.black,
    // Colors.grey,
    // Color(0xffC0C0C0),
    // Colors.blue,
    // Colors.purple[200],
    // Colors.grey[400],
    // Colors.green[700],
    // Colors.blue[800],
    // Colors.white,
    // Colors.pink,
    // Colors.white,
    // Colors.purple[700],

    "Black",
    "Grey",
    "Silver",
    "Blue",
    "Light Purple",
    "Shaded Grey",
    "Shaded Green",
    "Shaded Blue",
    "White",
    "Pink",
    "Shaded White",
    "Shaded Purple",
  ];

  var mobileImage = [
    "https://assets.swappie.com/cdn-cgi/image/width=600,height=600,fit=contain,format=auto/iphone-x-spacegrey-back-2-1-600x828.jpg",
    "https://cdn.dxomark.com/wp-content/uploads/medias/post-61183/iphone-12-pro-blue-hero.jpg",
    "https://dlcdnwebimgs.asus.com/gain/c05b6491-6d2b-48f0-81f0-d268840208d6/",
    "https://i.gadgets360cdn.com/products/large/1519753017_635_asus_zenfone_5z.jpg",
    "https://res.cloudinary.com/cenergy-innovation-limited-head-office/image/fetch/c_scale,q_70,f_auto,h_740/https://d1dtruvuor2iuy.cloudfront.net/media/catalog/product/a/9/a93_blue.jpg",
    "https://images.priceoye.pk/oppo-f19-pro-pakistan-priceoye-as3ft.jpg",
    "https://cdn.shopify.com/s/files/1/0269/6580/3031/products/Infinix-Smart-5_776de5b5-9c22-43e7-adde-880d38c843c2_1024x1024.png?v=1631128501",
    "https://i.gadgets360cdn.com/products/large/1558437240_635_infinixs4_db.jpg",
    "https://bestdenki.com.my/pub/media/catalog/product/cache/2a8088cbba62dcb5f58fee75f12b2390/s/l/slide133.jpg",
    "https://images.samsung.com/is/image/samsung/ph-galaxy-s9plus-sm-g965-sm-g965fzpgxtc-backpurplepurple-thumb-94571139?480_480_PNG",
    "https://www.shopkees.com/cdn/images/1000/1906076070_1622130701.jpg",
    "https://www.pakmobizone.pk/wp-content/uploads/2019/10/xiaomi-Redmi-8-2.jpg"
  ];

  var mobilePrize = [
    145000,
    176000,
    76100,
    145000,
    54000,
    47000,
    17200,
    23000,
    176500,
    91000,
    32000,
    30000,
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

  goBack() {
    Navigator.of(context).pushNamed("/mobiles");
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
                children: List.generate(mobilePrize.length, (index) {
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
                                                    mobileImage[index]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              var name = mobileName[index];
                                              var image = mobileImage[index];
                                              var prize = mobilePrize[index];
                                              var colors = mobilesColors[index];
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
                                          top: 215,
                                          left: 5,
                                          child: Text(
                                            mobileName[index],
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 241,
                                          child: Text(
                                            "${mobilePrize[index]} PKR",
                                            style: TextStyle(
                                                color: Color(0xff46eb78)),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130,
                                          top: 238,
                                          child: GestureDetector(
                                              onTap: () async {
                                                var name = mobileName[index];
                                                var image = mobileImage[index];
                                                var prize = mobilePrize[index];
                                                var colors =
                                                    mobilesColors[index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          // Positioned(
                                          //   top: 9,
                                          //   left: 15,
                                          //   child: GestureDetector(
                                          //       onTap: goBack,
                                          //       child:
                                          //           Icon(Icons.arrow_back_ios)),
                                          // ),
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                height: 550,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            mobileImage[
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
                                                        mobileName[index],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          var name =
                                                              mobileName[index];
                                                          var image =
                                                              mobileImage[
                                                                  index];
                                                          var prize =
                                                              mobilePrize[
                                                                  index];
                                                          var color =
                                                              mobilesColors[
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
                                                      "${mobilePrize[index]} PKR",
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
                                                          "Color: ${mobilesColors[index]}",
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
                                                        //         mobilesColors[
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
                                                                mobileName[
                                                                    index];
                                                            var image =
                                                                mobileImage[
                                                                    index];
                                                            var prize =
                                                                mobilePrize[
                                                                    index];
                                                            var color =
                                                                mobilesColors[
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

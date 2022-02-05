// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, avoid_print, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Grocery extends StatefulWidget {
  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  var groceryName = [
    "Apple",
    "Banana",
    "Pomegranate",
    "Pear",
    "Tomato",
    "Potato",
    "Onion",
    "Lemon",
    "Cooking Oil",
    "Salt",
    "Sugar",
    "Rice",
  ];

  var groceryImage = [
    "https://media.istockphoto.com/photos/red-delicious-apples-picture-id622795204?k=20&m=622795204&s=612x612&w=0&h=ZML1QAmIBvpm6XfQ5hlWR8an4wcFqdY65tdvRhZ9p7I=",
    "https://media.istockphoto.com/photos/banana-bunch-picture-id173242750?k=20&m=173242750&s=612x612&w=0&h=dgXrAP6otDeY5h6fhy-SRmW-2dFOCKx1_hNS1lLWF7Y=",
    "https://media.istockphoto.com/photos/pomegranate-isolated-on-white-background-with-clipping-path-picture-id1152895164?k=20&m=1152895164&s=612x612&w=0&h=h9eJJ6Wuu8VDtOoVmp57u7AhvuZmmlQY2q-dqiyIOyU=",
    "https://media.istockphoto.com/photos/green-yellow-pear-fruits-isolated-on-white-picture-id1131349074?k=20&m=1131349074&s=170667a&w=0&h=yYu38ztz24ONz4TiyVYoBZ1rXagA1wk_yZLaacweZgA=",
    "https://thumbs.dreamstime.com/b/isolated-tomato-fresh-cut-tomatoes-white-background-170813951.jpg",
    "https://media.istockphoto.com/photos/raw-potatoes-with-slices-picture-id496359598?b=1&k=20&m=496359598&s=170667a&w=0&h=obOXxUguEsuCok-7cHf6qOMhw-f8Bp06PKRRAqdASDc=",
    "https://media.istockphoto.com/photos/red-onions-picture-id499146498?k=20&m=499146498&s=612x612&w=0&h=fe8fftS2SpmSlx_KAT_wOPIhlwO9SFelIwq0nmG8NmA=",
    "https://media.istockphoto.com/photos/lemon-picture-id92280727?k=20&m=92280727&s=170667a&w=0&h=jAvNtCcW-pKyCfOV9QKYZSXB-QPXuiX_YNgYvFHz89c=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJTdeoPWEgiUrtzG99VPyvzEC9Xm6cAIW3XsqNHkP9ky65YnBjcWimImxyqp_eYLgFU9U&usqp=CAU",
    "https://digidukaan.s3.ap-south-1.amazonaws.com/683008235594262887.jpg",
    "https://flavourfactory.africa/wp-content/uploads/2019/05/WHITESUGAR.png",
    "https://media.istockphoto.com/photos/rice-on-a-white-background-picture-id1242507868?k=20&m=1242507868&s=170667a&w=0&h=Gzg9xBoCvjnrxDvq5MOeqs00NMzf92MI-m2_t6oennU="
  ];

  var groceryPrize = [150, 90, 250, 130, 100, 70, 50, 200, 700, 30, 110, 140];

  var groceryQuantity = [
    "1 kg",
    "1 pair",
    "1 kg",
    "1 kg",
    "1 kg",
    "1 kg",
    "1 kg",
    "1 kg",
    "3 kg",
    "1 packet",
    "1 kg",
    "1 kg",
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
    Navigator.of(context).pushNamed("/grocery");
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
          title: Center(child: Text("Grocery")),
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
                  padding: const EdgeInsets.only(left: 20),
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
                children: List.generate(groceryPrize.length, (index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: OpenContainer(
                            middleColor: Colors.green,
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
                                                    groceryImage[index]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10,
                                          left: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              var name = groceryName[index];
                                              var image = groceryImage[index];
                                              var prize = groceryPrize[index];
                                              var quantity =
                                                  groceryQuantity[index];
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
                                                          "color": quantity,
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
                                              color: Colors.black,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 200,
                                          left: 5,
                                          child: Text(
                                            groceryName[index],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 5,
                                          top: 230,
                                          child: Text(
                                            "${groceryPrize[index]} PKR",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130,
                                          top: 224,
                                          child: GestureDetector(
                                              onTap: () async {
                                                var name = groceryName[index];
                                                var image = groceryImage[index];
                                                var prize = groceryPrize[index];
                                                var quantity =
                                                    groceryQuantity[index];
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
                                                        "color": quantity,
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
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                height: 550,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            groceryImage[
                                                                index]))),
                                              )),
                                          Positioned(
                                            top: 9,
                                            left: 15,
                                            child: GestureDetector(
                                                onTap: goBack,
                                                child:
                                                    Icon(Icons.arrow_back_ios)),
                                          ),
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
                                                        groceryName[index],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          var name =
                                                              groceryName[
                                                                  index];
                                                          var image =
                                                              groceryImage[
                                                                  index];
                                                          var prize =
                                                              groceryPrize[
                                                                  index];
                                                          var quantity =
                                                              groceryQuantity[
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
                                                                          quantity,
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
                                                      "${groceryPrize[index]} PKR",
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
                                                          "Quantity: ${groceryQuantity[index]}",
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
                                                                groceryName[
                                                                    index];
                                                            var image =
                                                                groceryImage[
                                                                    index];
                                                            var prize =
                                                                groceryPrize[
                                                                    index];
                                                            var quantity =
                                                                groceryQuantity[
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
                                                                        quantity,
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

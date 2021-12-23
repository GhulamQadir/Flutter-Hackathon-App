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
    "https://images.unsplash.com/photo-1606757389723-23c4bf501fba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80",
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
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 8,
                  right: 8,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(groceryPrize.length, (index) {
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
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              NetworkImage(groceryImage[index]),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.only(bottom: 5),
                                    //   height: 90,
                                    //   width: 160,
                                    //   decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //       fit: BoxFit.fill,
                                    //       image:
                                    //           NetworkImage(groceryImage[index]),
                                    //     ),
                                    //     borderRadius: BorderRadius.all(
                                    //         Radius.circular(8.0)),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 3, left: 5),
                                          child: Text(
                                            groceryName[index],
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
                                            var name = groceryName[index];
                                            var image = groceryImage[index];
                                            var prize = groceryPrize[index];
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
                                                    .where("name",
                                                        isEqualTo: name)
                                                    .get()
                                                    .then((value) {
                                                    if (value.docs.isNotEmpty) {
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
                                        Text("${groceryPrize[index]} Rs"),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        GestureDetector(
                                            onTap: () async {
                                              var name = groceryName[index];
                                              var image = groceryImage[index];
                                              var prize = groceryPrize[index];
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

                                              Scaffold.of(context).showSnackBar(
                                                  SnackBar(
                                                      backgroundColor:
                                                          Colors.purple[300],
                                                      content: Text(
                                                          "Added to your cart")));
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
                                      groceryImage[index],
                                      height: 250,
                                      width: 300,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(groceryName[index]),
                                        GestureDetector(
                                          onTap: () {
                                            var name = groceryName[index];
                                            var image = groceryImage[index];
                                            var prize = groceryPrize[index];
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
                                          var name = groceryName[index];
                                          var image = groceryImage[index];
                                          var prize = groceryPrize[index];
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

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, missing_required_param, dead_code, unused_label, avoid_unnecessary_containers, avoid_print, curly_braces_in_flow_control_structures, avoid_function_literals_in_foreach_calls, annotate_overrides, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutterhackathon/screens/contact_us.dart';

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
    "Formal Shirt Green",
    "Formal Shirt Grey",
    "Formal Shirt Blue",
    "Formal Shirt Purple",
    "Formal Shirt Brown",
    "Formal Shirt Blue",
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

  var clothesColors = [
    // Colors.black,
    // Colors.blue[400],
    // Color(0xff000080),
    // Colors.green[400],
    // Colors.brown[200],
    // Colors.grey,
    // Color(0xff16b83e),
    // Colors.grey[400],
    // Color(0xff605e91),
    // Color(0xff8b89cc),
    // Colors.grey,
    // Colors.purple[200],

    "Black",
    "Light Blue",
    "Navy Blue",
    "Light Green",
    "Light Brown",
    "Dark Grey",
    "Green Black",
    "Light Grey",
    "Blue Black",
    "Blue White",
    "Dark Grey",
    "Light Purple",
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

  goToContactUs() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactUs()));
  }

  goBack() {
    Navigator.of(context).pushNamed("/clothes");
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
            canvasColor: Colors.grey[200],
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
                        color: Colors.purple,
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
                          child: Row(
                            children: [
                              Icon(Icons.home, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
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
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
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
                          child: Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Favorites",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: goToContactUs,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 5, left: 10),
                          child: Row(
                            children: [
                              Icon(Icons.call, color: Colors.grey),
                              SizedBox(width: 20),
                              Text(
                                "Contact Us",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
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
                              ? Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.grey),
                                    SizedBox(width: 20),
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.grey),
                                    SizedBox(width: 20),
                                    Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
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
                                              var colors = clothesColors[index];
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
                                              color: Colors.black,
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
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w500),
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
                                                var colors =
                                                    clothesColors[index];
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
                                                            clothesImage[
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
                                                        clothesName[index],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      trailing: GestureDetector(
                                                        onTap: () {
                                                          var name =
                                                              clothesName[
                                                                  index];
                                                          var image =
                                                              clothesImage[
                                                                  index];
                                                          var prize =
                                                              clothesPrize[
                                                                  index];
                                                          var color =
                                                              clothesColors[
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
                                                      "${clothesPrize[index]} PKR",
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
                                                          "Color: ${clothesColors[index]}",
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
                                                        //         clothesColors[
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
                                                                clothesName[
                                                                    index];
                                                            var image =
                                                                clothesImage[
                                                                    index];
                                                            var prize =
                                                                clothesPrize[
                                                                    index];
                                                            var color =
                                                                clothesColors[
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

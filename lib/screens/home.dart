// @dart=2.9
// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, missing_required_param, avoid_function_literals_in_foreach_calls, annotate_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var swiperImages = [
    "https://i.ytimg.com/vi/Gjh9FiDnWgc/maxresdefault.jpg",
    "https://cdn2.vectorstock.com/i/1000x1000/91/16/food-market-poster-template-grocery-store-vector-30199116.jpg",
    "https://i.pinimg.com/originals/8d/4b/75/8d4b75b5a4a50f728a3e6313a42b5f52.jpg",
    "https://www.gizmochina.com/wp-content/uploads/2019/06/Galaxy-A60-featured-546x546.jpg",
    "https://media.istockphoto.com/vectors/online-safe-delivery-service-courier-delivery-grocery-order-to-the-vector-id1216649302?k=20&m=1216649302&s=612x612&w=0&h=MD4EQMxwXyf6tVlMt6iJkyg2YH9-Zbk7zA4320dVqX8=",
  ];
  final List<IconData> categIcon = [
    (Icons.bolt),
    (Icons.car_rental),
    (Icons.phone),
    (Icons.collections),
    (Icons.shop),
  ];
  var categName = [
    " Electronics",
    " Cars",
    " Mobiles",
    " Clothes",
    " Groceries"
  ];

  var cardImages = [
    "http://www.albawaba.com/sites/default/files/styles/default/public/2021-08/Samsung%20Galaxy%20S21%20Ultra.jpg?itok=tHHiXwZ5",
    "https://i.ytimg.com/vi/LRcQdorxJTw/maxresdefault.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSybYQQV1Nq_4AzGdP4cGC1v6fViQcMDCsSQQ&usqp=CAU",
    "https://www.dawlance.com.pk/wp-content/uploads/2020/02/econo.png",
    "https://media.istockphoto.com/photos/shopping-basket-with-fresh-food-grocery-supermarket-food-and-eats-picture-id1216828053?k=20&m=1216828053&s=612x612&w=0&h=mMGSO8bG8aN0gP4wyXC17WDIcf9zcqIxBd-WZto-yeg=",
    "https://images.priceoye.pk/apple-iphone-12-mini-pakistan-priceoye-rukdw.jpg"
  ];

  var cardNames = [
    "Samsung",
    "City",
    "Coat Pant",
    "AC",
    "Grocery Pack",
    "Iphone X"
  ];

  var cardPrizes = ["15000", "2200000", "15000", "70000", "13000", "145000"];

  goToLoginScreen() {
    Navigator.of(context).pushNamed("/login");
  }

  goToProfileScreen() {
    Navigator.of(context).pushNamed("/user-profile");
  }

  goToHome() {
    Navigator.of(context).pushNamed("/home");
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  logOut() async {
    await auth.signOut();
    googleSignIn.disconnect();
    setState(() {});
    print("user diconnected");

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  goToFavorites() {
    Navigator.of(context).pushNamed("/favorites-screen");
  }

  goToCart() {
    Navigator.of(context).pushNamed("/cart-screen");
  }

  // categories functions
  goToElectronics() {
    Navigator.of(context).pushNamed("/electronics");
  }

  goToCars() {
    Navigator.of(context).pushNamed("/cars");
  }

  goToMobiles() {
    Navigator.of(context).pushNamed("/mobiles");
  }

  goToClothes() {
    Navigator.of(context).pushNamed("/clothes");
  }

  goToGrocery() {
    Navigator.of(context).pushNamed("/grocery");
  }

  List<int> data = [1, 2, 3, 4, 5, 6, 7];

  final firebaseUser = FirebaseAuth.instance.currentUser;

  FirebaseFirestore db = FirebaseFirestore.instance;

  int length = 0;

  getLength() async {
    // db
    //     .collection('users')
    //     .doc(firebaseUser.uid)
    //     .collection("myCart")
    //     .get()
    //     .then((myDocuments) {
    //   length = myDocuments.docs.length;
    // });

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

  Widget _buildItemList(BuildContext context, int index) {
    if (index == data.length)
      return Center(
        child: CircularProgressIndicator(),
      );
    return Container(
      width: 150,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 200,
            color: Colors.yellow,
            child: Center(
              child: Text(
                '${data[index]} ',
                style: TextStyle(fontSize: 40),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Welcome",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
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
                  style: TextStyle(color: Colors.black),
                ),
              ),
              // PURANA coDE HAAA !!!
              // FutureBuilder(
              //     future: getLength(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState != ConnectionState.done)
              //         return Text("Loading please wait ");

              //       return Padding(
              //         padding: const EdgeInsets.only(top: 9, right: 20),
              //         child: Text(
              //           '$length',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       );
              //     }),
              GestureDetector(
                onTap: FirebaseAuth.instance.currentUser == null
                    ? goToLoginScreen
                    : logOut,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 18,
                    right: 10,
                  ),
                  child: Text(
                    FirebaseAuth.instance.currentUser == null
                        ? "Login"
                        : "LogOut",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
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
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    itemCount: swiperImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                              height: 250,
                              width: 400,
                              child: Image.network(
                                swiperImages[index],
                                fit: BoxFit.fill,
                              )),
                        ],
                      );
                    },
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 18, top: 17, bottom: 17),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: goToElectronics,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffededed),
                                          spreadRadius: 5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.bolt,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Electronics",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: goToCars,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffededed),
                                          spreadRadius: 5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.car,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Cars",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: goToMobiles,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffededed),
                                          spreadRadius: 5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.mobileAlt,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Mobiles",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: goToClothes,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffededed),
                                          spreadRadius: 5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 32,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.tshirt,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Clothes",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: goToGrocery,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Color(0xffededed),
                                          spreadRadius: 5)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        FontAwesomeIcons.shopify,
                                        color: Colors.black54,
                                      )),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Groceries",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 30, left: 15, bottom: 15),
                  child: Text(
                    "Trending Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // crossAxisSpacing: 3,
                    mainAxisSpacing: 20,
                    childAspectRatio:
                        300 / (MediaQuery.of(context).size.height / 1.5),
                  ),
                  itemCount: cardImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 300,
                        child: Card(
                          elevation: 3,
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 220,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            NetworkImage(cardImages[index]))),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text(cardNames[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10, top: 10),
                                child: Text("PKR ${cardPrizes[index]}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

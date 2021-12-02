// @dart=2.9
// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, missing_required_param

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var swiperImages = [
    "https://i.ytimg.com/vi/Gjh9FiDnWgc/maxresdefault.jpg",
    "https://cdn2.vectorstock.com/i/1000x1000/91/16/food-market-poster-template-grocery-store-vector-30199116.jpg",
    "https://i.pinimg.com/originals/8d/4b/75/8d4b75b5a4a50f728a3e6313a42b5f52.jpg",
    "http://adxmaster.com/wp-content/uploads/2020/05/in-app-banner-placements.png",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvytx8uu9r2eaIXw3BafuTCX6tnwOoHnPXA&usqp=CAU",
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
            title: Text("Welcome"),
            backgroundColor: Colors.purple,
            actions: [
              GestureDetector(
                  onTap: FirebaseAuth.instance.currentUser == null
                      ? goToLoginScreen
                      : goToCart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Icon(Icons.shopping_cart),
                  )),
              GestureDetector(
                onTap: FirebaseAuth.instance.currentUser == null
                    ? goToLoginScreen
                    : logOut,
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, right: 10),
                  child: Text(
                    FirebaseAuth.instance.currentUser == null
                        ? "Login"
                        : "LogOut",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                // GridView.count(
                //   physics: NeverScrollableScrollPhysics(),
                //   crossAxisCount: 3,
                // crossAxisSpacing: 10,
                // mainAxisSpacing: 10,
                //   shrinkWrap: true,
                //   children: List.generate(categName.length, (index) {
                //     return Column(
                //       children: [
                //         Icon(
                //           categIcon[index],
                //           color: Colors.purple,
                //           size: 30,
                //         ),
                //         SizedBox(
                //           height: 8,
                //         ),
                //         Text(categName[index],
                //             style: TextStyle(
                //                 fontSize: 17,
                //                 color: Color(0xffA0A0A0),
                //                 fontWeight: FontWeight.w700)),
                //       ],
                //     );
                //   }),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: goToElectronics,
                      child: Column(
                        children: [
                          Icon(
                            Icons.bolt,
                            color: Colors.purple,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Electronics",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xffA0A0A0),
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: goToCars,
                      child: Column(
                        children: [
                          Icon(
                            Icons.car_rental,
                            color: Colors.purple,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Cars",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xffA0A0A0),
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: goToMobiles,
                      child: Column(
                        children: [
                          Icon(
                            Icons.phone_android_rounded,
                            color: Colors.purple,
                            size: 30,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text("Mobiles",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xffA0A0A0),
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 40,
                      ),
                      child: GestureDetector(
                        onTap: goToClothes,
                        child: Column(
                          children: [
                            Icon(
                              Icons.collections,
                              color: Colors.purple,
                              size: 30,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Clothes",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xffA0A0A0),
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 55),
                      child: GestureDetector(
                        onTap: goToGrocery,
                        child: Column(
                          children: [
                            Icon(
                              Icons.local_grocery_store_outlined,
                              color: Colors.purple,
                              size: 30,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Groceries",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xffA0A0A0),
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 20, left: 15, bottom: 15),
                  child: Text(
                    "Trending Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

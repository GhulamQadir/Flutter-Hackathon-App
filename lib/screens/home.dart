// @dart=2.9
// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, missing_required_param, avoid_function_literals_in_foreach_calls, annotate_overrides, deprecated_member_use

import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/auth/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var swiperImages = [
    "https://www.stratstone.com/-/media/stratstone/blog/2020/top-5-best-gt-cars-available/best-gt-cars-available-1600x900-2px.ashx",
    "https://cdn.vox-cdn.com/thumbor/342qpa02oBj5wry-LILlAyKz3qc=/0x0:1306x734/1400x933/filters:focal(549x263:757x471):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/68490964/Best_Phone_Grid_Fall_2021_16x9.10.jpg",
    "https://i.pinimg.com/736x/f1/f6/c2/f1f6c2ec5f3ae7bff95b025bdcd9a1ff.jpg",
    "https://cdn2.vectorstock.com/i/1000x1000/91/16/food-market-poster-template-grocery-store-vector-30199116.jpg",
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
    "https://cdn.dxomark.com/wp-content/uploads/medias/post-61183/iphone-12-pro-blue-hero.jpg",
    "https://autos.hamariweb.com/images/carimages/car_6916_777434.jpg",
    "https://cdna.lystit.com/photos/countryhouseoutdoor/adc3d9b5/joules-Sea-Blue-Plain-Tee-Jersey-Mens-T-shirt-w.jpeg",
    "https://www.dawlance.com.pk/wp-content/uploads/2020/02/econo.png",
    "https://dlcdnwebimgs.asus.com/gain/c05b6491-6d2b-48f0-81f0-d268840208d6/",
    "https://media.takealot.com/covers_images/1ac61daf490e4c73ac8d57cdd867b9cb/s-pdpxl.file"
  ];

  var cardsDetails = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ];

  var cardNames = [
    "Iphone 12",
    "Honda Civic 2020",
    "Navy blue T-Shirt",
    "Dawlance AC",
    "Asus Zenfone 5Z",
    "Formal Shirt Blue"
  ];

  var cardsImgColors = [
    "Grey",
    "White",
    "Navy Blue",
    "Light Brown",
    "Silver",
    "Blue Black"
  ];

  var cardPrizes = [176000, 4150000, 1000, 84500, 76100, 2100];

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

  goBack() {
    Navigator.of(context).pushNamed("/home");
  }

  List<int> data = [1, 2, 3, 4, 5, 6, 7];

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

  String userName;
  String email;
  String image;
  currentUserProfile() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userName = ds.data()['userName'];
        email = ds.data()['email'];
        image = ds.data()['image'];
        // phoneNo = ds.data()['phoneNo'];
      }).catchError((e) {
        print(e);
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

  goToUserProfile() {
    Navigator.of(context).pushNamed("/user-profile");
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
                    top: 4,
                    right: 15,
                  ),
                  child: FirebaseAuth.instance.currentUser == null
                      ? Text("Login")
                      : FutureBuilder(
                          future: currentUserProfile(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done)
                              return Text("Loading please wait ");

                            return Container(
                              child: GestureDetector(
                                onTap: goToUserProfile,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(image ?? ''),
                                ),
                              ),
                            );
                          }),

                  // Text(
                  //   FirebaseAuth.instance.currentUser == null
                  //       ? "Login"
                  //       : "LogOut",
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.black),
                  // ),
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 15,
                    childAspectRatio:
                        310 / (MediaQuery.of(context).size.height / 1.5),
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(cardPrizes.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: OpenContainer(
                                transitionDuration: Duration(seconds: 1),
                                transitionType:
                                    ContainerTransitionType.fadeThrough,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              height: 260,
                                            ),
                                            Positioned(
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 2),
                                                height: 180,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        cardImages[index]),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 10,
                                              left: 5,
                                              child: GestureDetector(
                                                onTap: () {
                                                  var name = cardNames[index];
                                                  var image = cardImages[index];
                                                  var prize = cardPrizes[index];
                                                  var colors =
                                                      cardsImgColors[index];
                                                  var description =
                                                      cardsDetails[index];

                                                  FirebaseFirestore db =
                                                      FirebaseFirestore
                                                          .instance;

                                                  FirebaseAuth.instance
                                                              .currentUser ==
                                                          null
                                                      ? goToLoginScreen()
                                                          .pushNamed("/login")
                                                      : db
                                                          .collection("users")
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser
                                                              .uid)
                                                          .collection(
                                                              "favorites")
                                                          .where("name",
                                                              isEqualTo: name)
                                                          .get()
                                                          .then((value) {
                                                          if (value.docs
                                                              .isNotEmpty) {
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
                                                                .collection(
                                                                    "users")
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
                                                              "details":
                                                                  description
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
                                                  Icons
                                                      .favorite_border_outlined,
                                                  color: Colors.black,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 215,
                                              left: 5,
                                              child: Text(
                                                cardNames[index],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Positioned(
                                              left: 5,
                                              top: 241,
                                              child: Text(
                                                "${cardPrizes[index]} PKR",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Positioned(
                                              left: 130,
                                              top: 238,
                                              child: GestureDetector(
                                                  onTap: () async {
                                                    var name = cardNames[index];
                                                    var image =
                                                        cardImages[index];
                                                    var prize =
                                                        cardPrizes[index];
                                                    var colors =
                                                        cardsImgColors[index];
                                                    var description =
                                                        cardsDetails[index];

                                                    FirebaseFirestore db =
                                                        FirebaseFirestore
                                                            .instance;

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
                                                            .collection(
                                                                "myCart")
                                                            .add({
                                                            "name": name,
                                                            "image": image,
                                                            "prize": prize,
                                                            "color": colors,
                                                            "details":
                                                                description
                                                          });

                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.purple[
                                                                    300],
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
                                                                cardImages[
                                                                    index]))),
                                                  )),
                                              Positioned(
                                                top: 9,
                                                left: 15,
                                                child: GestureDetector(
                                                    onTap: goBack,
                                                    child: Icon(
                                                        Icons.arrow_back_ios)),
                                              ),
                                              Positioned(
                                                top: 400,
                                                right: 15,
                                                left: 10,
                                                child: Container(
                                                  height: 300,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff2f2f2),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    15),
                                                            topRight:
                                                                Radius.circular(
                                                                    15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15)),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 15,
                                                        ),
                                                        child: ListTile(
                                                          title: Text(
                                                            cardNames[index],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          trailing:
                                                              GestureDetector(
                                                            onTap: () {
                                                              var name =
                                                                  cardNames[
                                                                      index];
                                                              var image =
                                                                  cardImages[
                                                                      index];
                                                              var prize =
                                                                  cardPrizes[
                                                                      index];
                                                              var color =
                                                                  cardsImgColors[
                                                                      index];
                                                              var description =
                                                                  cardsDetails[
                                                                      index];

                                                              FirebaseFirestore
                                                                  db =
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
                                                                      .where(
                                                                          "name",
                                                                          isEqualTo:
                                                                              name)
                                                                      .get()
                                                                      .then(
                                                                          (value) {
                                                                      if (value
                                                                          .docs
                                                                          .isNotEmpty) {
                                                                        Scaffold.of(context).showSnackBar(SnackBar(
                                                                            backgroundColor:
                                                                                Colors.purple[300],
                                                                            content: Text("Already added to favorites")));
                                                                        print(
                                                                            "Already added to favorites");
                                                                      } else {
                                                                        db
                                                                            .collection("users")
                                                                            .doc(FirebaseAuth.instance.currentUser.uid)
                                                                            .collection("favorites")
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
                                                                                Colors.purple[300],
                                                                            content: Text("Added to favorites")));
                                                                        print(
                                                                            "Added to favorites");
                                                                      }
                                                                    });
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_border_outlined,
                                                              color:
                                                                  Colors.grey,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 15,
                                                        ),
                                                        child: Text(
                                                          "${cardPrizes[index]} PKR",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 10,
                                                                left: 13),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Color: ${cardsImgColors[index]}",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10,
                                                                right: 10),
                                                        child: Text(
                                                          cardsDetails[index],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[600]),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Center(
                                                        child: Container(
                                                          width: 160,
                                                          child: TextButton(
                                                              onPressed:
                                                                  () async {
                                                                var name =
                                                                    cardNames[
                                                                        index];
                                                                var image =
                                                                    cardImages[
                                                                        index];
                                                                var prize =
                                                                    cardPrizes[
                                                                        index];
                                                                var color =
                                                                    cardsImgColors[
                                                                        index];
                                                                var description =
                                                                    cardsDetails[
                                                                        index];

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
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                              style:
                                                                  ButtonStyle(
                                                                      backgroundColor: MaterialStateProperty.all<
                                                                              Color>(
                                                                          Color(
                                                                              0xff696969)),
                                                                      shape: MaterialStateProperty
                                                                          .all<
                                                                              RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30)),
                                                                      ))),
                                                        ),
                                                      ),
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
              ],
            ),
          ),
        ));
  }
}

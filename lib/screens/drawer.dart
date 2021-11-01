// // @dart=2.9
// // ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_print, sized_box_for_whitespace, use_key_in_widget_constructors
// import 'package:flutter/material.dart';

// class Drawer extends StatefulWidget {
//   @override
//   _DrawerState createState() => _DrawerState();
// }

// class _DrawerState extends State<Drawer> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             drawer: Theme(
//                 data: Theme.of(context).copyWith(
//                   canvasColor: Colors.red[500],
//                 ),
//                 child: Drawer(
//                     child: SafeArea(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(13),
//                             child: Container(
//                               height: 35,
//                               width: 140,
//                               decoration: BoxDecoration(
//                                   color: Colors.black,
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: Center(
//                                 child: Text(
//                                   "News Express",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 19,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 5, bottom: 5, left: 10),
//                                     child: Text(
//                                       "Sports",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   )),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 5, bottom: 5, left: 10),
//                                     child: Text(
//                                       "Stories",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   )),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 5, bottom: 5, left: 10),
//                                     child: Text(
//                                       "Favorites",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   )),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )))));
//   }
// }

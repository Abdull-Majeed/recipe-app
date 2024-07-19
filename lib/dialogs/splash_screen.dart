// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:recipes_app/pages/home_page.dart';
// import 'package:recipes_app/pages/login_page.dart';
//
// class splashScreen extends StatefulWidget {
//   const splashScreen({super.key});
//
//   @override
//   State<splashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<splashScreen> {
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(milliseconds: 3000), () {
//       if (FirebaseAuth.instance.currentUser != null) {
//         log('\n User:${FirebaseAuth.instance.currentUser}');
//
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => HomePage()));
//       } else {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => LoginPage()));
//       }
//     });
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Center(
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 230),
//                   child: Image.asset('assets/images/BackGroundLogo.png'),
//                 ),
//               ),
//             ),
//             SizedBox(height: 200),
//             Column(
//               children: [
//                 Text(
//                   'Made By Student Of SIBA Mirpurkhas',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
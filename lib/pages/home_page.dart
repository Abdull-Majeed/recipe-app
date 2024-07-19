import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/models/user_model.dart';
import 'package:recipes_app/pages/about_page.dart';
import 'package:recipes_app/pages/edit_profile.dart';
import 'package:recipes_app/pages/addRecipe.dart';
import 'package:recipes_app/pages/login_page.dart';
import 'package:recipes_app/pages/setting_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   LoginPage LogOut() {
//     return LoginPage();
//   }

//   User? user = FirebaseAuth.instance.currentUser;
//   UserModel loggedInUser = UserModel();

//   @override
//   void initState() {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       this.loggedInUser = UserModel.fromMap(value.data());
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: null,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.restaurant_menu),
//             SizedBox(
//               width: 10,
//             ),
//             Text("Majeed's kitchen"),
//           ],
//         ),
//       ),
//       endDrawer: Drawer(
//         width: 250,
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             Column(
//               children: [
//                 UserAccountsDrawerHeader(
//                   accountName: Text(
//                     "${loggedInUser.firstName} ${loggedInUser.secondName}",
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.w500),
//                   ),
//                   accountEmail: Text("${loggedInUser.email}"),
//                   currentAccountPicture: CircleAvatar(
//                     child: ClipOval(
//                       child: Image.asset('assets/images/logo1.png'),
//                     ),
//                     backgroundColor: const Color.fromARGB(255, 212, 212, 212),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 40, left: 10),
//                       child: Icon(
//                         Icons.person,
//                         size: 18,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 12,
//                         top: 40,
//                       ),
//                       child: InkWell(
//                         child: Text(
//                           "Profile",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w500),
//                         ),
//                         onTap: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => EditProfile(),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, left: 10),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.add,
//                           size: 18,
//                         ),
//                       ),
//                       // ),
//                       InkWell(
//                           child: Text(
//                             "Add Recipe",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w500),
//                           ),
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => FavoriteRecipesApp(),
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, left: 10),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.details_sharp,
//                           size: 18,
//                         ),
//                       ),
//                       // ),
//                       InkWell(
//                           child: Text(
//                             "About",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w500),
//                           ),
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => AboutPage(),
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, left: 10),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.settings,
//                           size: 18,
//                         ),
//                       ),
//                       // ),
//                       InkWell(
//                           child: Text(
//                             "Settings",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w500),
//                           ),
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => Setting(),
//                               ),
//                             );
//                           }),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40, left: 10),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.logout,
//                           size: 18,
//                         ),
//                       ),
//                       // ),
//                       InkWell(
//                           child: Text(
//                             "Log out",
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.w500),
//                           ),
//                           onTap: () {
//                             logOut(context);
//                           }),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 2, left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset(
//                   'assets/images/img4.jpg',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => firstList()));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img2.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => secondList()));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img3.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => thirdList(),
//                 ));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img1.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => fourList(),
//                 ));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img5.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => fiveList(),
//                 ));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img6.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => sixList()));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img7.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => sevenList(),
//                 ));
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 7, right: 7, bottom: 10),
//             child: InkWell(
//               child: Container(
//                 height: 200,
//                 child: Image.asset('assets/images/img4.jpg', fit: BoxFit.cover),
//               ),
//               onTap: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) => eightList()));
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> logOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context)
//         .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
//   }

//   firstList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Fish Fry',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   secondList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Chapli Kabbab',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   thirdList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe for Cake',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   fourList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Haleem',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   fiveList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Pizza',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   sixList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Sweet Dish',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   sevenList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Biryani',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   eightList() {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: ListView(
//               children: [
//                 Center(
//                     child: Text(
//                   'Recipe of Fish Fry',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.redAccent),
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20),
//                   child: Text(
//                     'Certainly! Here is a basic recipe for Chicken Biryani, '
//                     'a popular and flavorful dish in South Asian cuisine:\n'
//                     'Chicken Biryani Recipe  \n'
//                     'Ingredients:\n'
//                     'For the Chicken Marinade: '
//                     '- 500g chicken, cut into pieces '
//                     '- 1 cup yogurt '
//                     '- 1 tablespoon ginger-garlic paste '
//                     '- 1 teaspoon red chili powder '
//                     '- 1 teaspoon turmeric powder '
//                     '- Salt to taste  For the Rice: '
//                     '- 2 cups basmati rice, soaked for 30 minutes '
//                     '- 4-5 cups water '
//                     '- 2-3 green cardamom pods '
//                     '- 2-3 cloves - 1-inch cinnamon stick - Salt to taste  For the Biryani: '
//                     '- 3 tablespoons ghee (clarified butter) or oil '
//                     '- 2 large onions, thinly sliced '
//                     '- 1/2 cup fried onions (for garnish) '
//                     '- 1/2 cup chopped fresh coriander leaves (for garnish) '
//                     '- 1/2 cup chopped fresh mint leaves (for garnish) '
//                     '- 1/4 cup warm milk - A pinch of saffron strands (soaked in warm milk) '
//                     '- 1 teaspoon biryani masala - Ghee or oil for cooking.  \n'
//                     '**Instructions:**  \n'
//                     '1. Marinate the Chicken:\n    '
//                     '- In a bowl, mix the chicken pieces with yogurt, ginger-garlic paste, red chili powder, turmeric powder, and salt.    '
//                     '- Let it marinate for at least 2 hours or overnight in the refrigerator for better flavor.  \n'
//                     '2. Cook the Rice:\n    '
//                     '- Bring water to a boil in a large pot.'
//                     '- Add soaked and drained basmati rice, green cardamom pods, cloves, cinnamon stick, and salt.'
//                     '- Cook the rice until it is 70-80% cooked. It should still have a bite to it.    '
//                     '- Drain the water and set aside.  '
//                     '\n3. Prepare Fried Onions:\n'
//                     '- Heat ghee or oil in a pan.    '
//                     '- Add thinly sliced onions and fry until they are golden brown and crispy.    '
//                     '- Remove half for garnish and set aside.  '
//                     '\n4. Cook the Chicken:\n    '
//                     '- In a large, heavy-bottomed pan, heat ghee or oil.    '
//                     '- Add the marinated chicken and cook until it is partially cooked.    '
//                     '- Remove half of the partially cooked chicken for layering.  '
//                     '\n5. Layering:\n    - In the same pan with the remaining chicken, add a layer of half-cooked rice.    '
//                     '- Sprinkle fried onions, biryani masala, chopped mint, chopped coriander, and saffron-infused milk.    '
//                     '- Repeat the layers until all the rice and chicken are used.    '
//                     '- Finish with a layer of rice on top.  '
//                     '\n6. Dum Cooking:\n    '
//                     '- Seal the pan tightly with foil or a lid to trap the steam.    '
//                     '- Cook on low heat (dum) for about 20-25 minutes until the rice and chicken are fully cooked and infused with flavors.  '
//                     '\n7. Garnish and Serve:\n    '
//                     '- Gently fluff the biryani with a fork.    '
//                     '- Garnish with fried onions, chopped mint, and chopped coriander.    '
//                     '- Serve hot with raita or a side salad.  '
//                     'Enjoy your homemade Chicken Biryani! Adjust the spice levels and ingredients according to your taste preferences.',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          //Jaaaaaaaaaaaaavvvvvvaaaaaaaaaaaaaaaaaaaaaaa
          InkWell(
            child: Container(
              height: 220,
              child: Text(
                'Learn about JAVA',
                style: TextStyle(
                  color: Colors.white12,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpg'),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Java(),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),

          //Pytttttthhhhhhhooooooonnnnnnn
          InkWell(
            child: Container(
              height: 220,
              child: Text(
                'Learn about Python',
                style: TextStyle(
                  color: Colors.white12,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpg'),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Python(),
                ),
              );
            },
          ),

          SizedBox(
            height: 20,
          ),
          
          //JavaaaaScripttttt
          InkWell(
            child: Container(
              height: 220,
              child: Text(
                'Learn about JavaScript',
                style: TextStyle(
                  color: Colors.white12,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/img1.jpg'),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => JavaScript(),
                ),
              );
            },
          ),


        ],
      ),
    );
  }
}

Java() {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      width: 550,
      child: Text(
        'ALL ABOUT JAVA',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 252, 241, 241),
        ),
      ),
    ),
  );
}

Python() {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      width: 550,
      child: Text(
        'ALL ABOUT PYTHON',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 252, 241, 241),
        ),
      ),
    ),
  );
}

JavaScript() {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      width: 550,
      child: Text(
        'ALL ABOUT JAVASCRIPT',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 252, 241, 241),
        ),
      ),
    ),
  );
}

// // ignore_for_file: non_constant_identifier_names

// import 'package:dating_app/cntroller/auth_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// Container signInSignUpButton(
//   BuildContext context,
//   bool isLogin,
//   Function onTap,
// ) {
//   return Container(
//     child: Obx(()=>
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: 50,
//         margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(90),
//         ),
//         child: ElevatedButton(
//           onPressed: () {
//             onTap();
//           },
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.resolveWith((states) {
//                 if (states.contains(MaterialState.pressed)) {
//                   return Colors.black26;
//                 }
//                 return Colors.white;
//               }),
//               shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
//           child:controller.loading.value?CircularProgressIndicator(color: Colors.white,): Text(
//             isLogin ? "LOG IN" : "SIGN UP",
//             style: const TextStyle(
//               color: Colors.black87,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
// // TextField TextCntrollerForDetails(
// //   String text,
// // ) {
// //   return TextField(
// //     cursorColor: Colors.white,
// //     style: TextStyle(
// //       color: Colors.black.withOpacity(0.9),
// //     ),
// //     decoration: InputDecoration(
// //         labelText: text,
// //         filled: true,
// //         floatingLabelBehavior: FloatingLabelBehavior.never,
// //         fillColor: Colors.white.withOpacity(0.3),
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(30.0),
// //             borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
// //   );
// // }

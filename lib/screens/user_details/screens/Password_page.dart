// import 'package:dating_app/screens/user_details/customwidgets/app_bar_controller.dart';
// import 'package:dating_app/screens/user_details/screens/gender_adding_page.dart';
// import 'package:dating_app/screens/user_details/customwidgets/text_edit_controller.dart';
// import 'package:flutter/material.dart';

// class PasswordPage extends StatefulWidget {
//   const PasswordPage({Key? key}) : super(key: key);

//   @override
//   _VerificationCodePageState createState() => _VerificationCodePageState();
// }

// class _VerificationCodePageState extends State<PasswordPage> {
//   final TextEditingController _verificationCodeController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: const AppBarController(),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "enter password",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.1,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//               SizedBox(
//                 height: screenWidth * 0.15,
//               ),
//               TextCntroller(
//                 "enter password",
//                 Icons.person,
//                 false,
//                 _verificationCodeController,
//                 TextInputType.number
                
//               ),
//               SizedBox(height: screenWidth * 0.15),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
                    
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const GenderAddingPage(),
//                       ),
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red.withOpacity(0.6),
//                   elevation: 0,
//                 ),
//                 child: Text(
//                   'Next',
//                   style: TextStyle(
//                     fontSize: screenWidth * 0.05,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

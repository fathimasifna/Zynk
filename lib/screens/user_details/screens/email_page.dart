// import 'package:dating_app/screens/user_details/customwidgets/app_bar_controller.dart';
// import 'package:dating_app/screens/user_details/customwidgets/text_edit_controller.dart';
// import 'package:dating_app/screens/user_details/Password_page.dart';
// import 'package:flutter/material.dart';

// class EmailPage extends StatefulWidget {
//   const EmailPage({Key? key}) : super(key: key);

//   @override
//   _EmailPageState createState() => _EmailPageState();
// }

// class _EmailPageState extends State<EmailPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: const AppBarController(),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Enter E-mail",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.1,
//                 fontWeight: FontWeight.w900,
//               ),
//             ),
//             SizedBox(
//               height: screenWidth * 0.15,
//             ),
//             TextCntroller(
//               "Enter mail id",
//               Icons.mail,
//               false,
//               _emailController,
//               TextInputType.emailAddress
              
//             ),
//             SizedBox(height: screenWidth * 0.15),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState?.validate() ?? false) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const PasswordPage(),
//                     ),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red.withOpacity(0.6),
//                 elevation: 0,
//               ),
//               child: Text(
//                 'Next',
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.05,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

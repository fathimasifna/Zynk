import 'package:dating_app/screens/login_page/controller/signin_up_controller.dart';
import 'package:dating_app/screens/user_details/customwidgets/text_edit_controller.dart';
import 'package:dating_app/screens/user_details/screens/gender_adding_page.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
  
class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Color.fromARGB(255, 228, 144, 138),
              Color.fromARGB(255, 228, 144, 138),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).size.height * 0.2,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              TextCntroller(
                "Enter User Name",
                Icons.person_outlined,
                false,
                _usernameTextController,
                              TextInputType.name

              ),
              const SizedBox(
                height: 20,
              ),
              TextCntroller(
                "Enter Email-id",
                Icons.mail,
                true,
                _emailTextController,
                              TextInputType.emailAddress

              ),
              const SizedBox(
                height: 20,
              ),
              TextCntroller(
                "Enter Password",
                Icons.lock_outlined,
                true,
                _passwordTextController,
                                              TextInputType.number

              ),
               const SizedBox(
                height: 20,
              ),
             
              signInSignUpButton(context, false, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GenderAddingPage()));
              })
            
            ],
          ),
        )),
      ),
    );
  }
}

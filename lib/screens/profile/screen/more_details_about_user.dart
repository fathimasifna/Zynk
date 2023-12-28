import 'package:flutter/material.dart';

class AddMoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "More Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60,left: 8,right: 8),
          child: Column(
            children: [
              

               TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
            ),
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: const Icon(Icons.person),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
          SizedBox(height: 20,),
           TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
            ),
            decoration: InputDecoration(
              labelText: 'Qualifications',
              prefixIcon: const Icon(Icons.school),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextFormField(
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.9),
                ),
                decoration: InputDecoration(
                  labelText: 'Job',
                  prefixIcon: const Icon(Icons.work),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(width: 0, style: BorderStyle.none),
                  ),
                ),
              ),
                        SizedBox(height: 20,),
           TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
            ),
            decoration: InputDecoration(
              labelText: 'Hobbies',
              prefixIcon: const Icon(Icons.interests_rounded),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
                       SizedBox(height: 20,),
           TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black.withOpacity(0.9),
            ),
            decoration: InputDecoration(
              labelText: 'Bio',
              prefixIcon: const Icon(Icons.interests),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
            ),
          ),
          
            ],
          ),
         
        ),
        
      ),
    );
  }
}

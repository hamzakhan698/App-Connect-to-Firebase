import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {


  TextEditingController userName =  TextEditingController();
  TextEditingController userAddress =  TextEditingController();
  TextEditingController userEmail =  TextEditingController();
  TextEditingController userPassword =  TextEditingController();


  void addUser()async{

    Map<String, dynamic> uAdd = {
      "userName" : userName.text,
      "userAddress" :  userAddress.text,
      "userEmail" : userEmail.text,
      "userPassword" : userPassword.text,
    };

    await FirebaseFirestore.instance.collection("userData").add(uAdd);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Added")));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

      Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextFormField(
        controller: userName,
        decoration: InputDecoration(
            label: Text("Enter Your Name"),
            hintText: "Police wala ka beta",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(14)
            )
        ),
      ),
    ),




      Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextFormField(
        controller: userAddress,
        decoration: InputDecoration(
            label: Text("Enter Your Address"),
            hintText: "Street A 123",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(14)
            )
        ),
      ),
    ),

      Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: TextFormField(
        controller: userEmail,
        decoration: InputDecoration(
            label: Text("Enter Your Email"),
            hintText: "Police wala ka beta hassan@gmail.com",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(14)
            )
        ),
      ),
    ),
         Container(
         margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: TextFormField(
           controller: userPassword,
           decoration: InputDecoration(
           label: Text("Enter Your Password"),
           hintText: "12**BA@",
            prefixIcon: Icon(Icons.key),
           border: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(14)
          )
           ),
           ),
         ),

            Center(
              child: Container(
                width: 120,
                height: 40,
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    addUser();
                  }, child: Text("Add User")),
                ),
              ),
            )
          ],
    ),
    );
  }
}



import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_connect1/login_screen.dart';
import 'package:flutter/material.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {

  void userLogout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${FirebaseAuth.instance.currentUser!.email.toString()}"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        }, child: Text("LogOut")),
      ),
    );
  }
}

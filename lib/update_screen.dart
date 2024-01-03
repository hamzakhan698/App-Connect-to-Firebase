import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.uName, required this.uEmail, required this.uAddress,required this.uPassword, required this.uID});

final String uName;
final String uEmail;
final String uPassword;
final String uAddress;
final String uID;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

TextEditingController userName =TextEditingController();
TextEditingController userAddress =TextEditingController();
TextEditingController userEmail =TextEditingController();
TextEditingController userPassword =TextEditingController();



@override
void initState() {
userName.text = widget.uName;
userAddress.text = widget.uAddress;
userEmail.text = widget.uEmail;
userPassword.text = widget.uPassword;

super.initState();
}

void UserUpdate()async{
try{
await FirebaseFirestore.instance.collection("userData").doc(widget.uID).update(
{
  "userName" : userName.text,
  "userAddress" : userAddress.text,
  "userEmail" : userEmail.text,
  "userPssword" : userPassword.text,
});

ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Updated")));
Navigator.pop(context);

} on FirebaseException catch(ex){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
     Container(
       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
       child: TextFormField(
        controller: userName,
         decoration: InputDecoration(
           label:Text('Enter Your User Name'),
           hintText:"John doe",
           prefixIcon:Icon(Icons.person),
           border:OutlineInputBorder(
             borderSide:BorderSide(color: Colors.black),
             borderRadius: BorderRadius.circular(14)
           )
         ),
       ),
),

       Container(
         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         child: TextFormField(
           controller: userAddress,
           decoration: InputDecoration(
               label:Text('Enter Your Address'),
               hintText:"Street 1244",
               prefixIcon:Icon(Icons.location_on),
               border:OutlineInputBorder(
                   borderSide:BorderSide(color: Colors.black),
                   borderRadius: BorderRadius.circular(14)
               )
           ),
         ),
       ),

       Container(
         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         child: TextFormField(
           controller: userEmail,
           decoration: InputDecoration(
               label:Text('Enter Your Email'),
               hintText:"Johndoe11@gmail.com",
               prefixIcon:Icon(Icons.mail),
               border:OutlineInputBorder(
                   borderSide:BorderSide(color: Colors.black),
                   borderRadius: BorderRadius.circular(14)
               )
           ),
         ),
       ),

       Container(
         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
         child: TextFormField(
           controller: userPassword,
           decoration: InputDecoration(
               label:Text('Enter Your Password'),
               hintText:"Jon**232",
               prefixIcon:Icon(Icons.key),
               border:OutlineInputBorder(
                   borderSide:BorderSide(color: Colors.black),
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
              child:ElevatedButton(onPressed: (){
              UserUpdate();
              }, child: Text("Update User"),
           ),
        ),
      )

      ),
],
    ),
    );
  }
}
